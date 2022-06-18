import Foundation

class DataBase {
    //zcofu8bnd3ldl
    //https://sheetdb.io/api/v1/zcofu8bnd3ldl/keys
    var id: String
    let session = URLSession(configuration: .default)
    
    init(api id: String) {
        self.id = id
    }
    
    lazy var mainUrlString: String = {
        return "https://sheetdb.io/api/v1/" + id
    }()
    
   open func obtainSheet(completion: @escaping (Result<Sheet,SheetError>) -> Void) {
        guard let url = URL(string: mainUrlString) else {
            completion(.failure(.apiError))
            return }
       session.dataTask(with: url) { data, _ , error in
            guard error == nil else {
                completion(.failure(.invalidEndpoint))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
           guard let sheet = self.decodejson(type: Sheet.self, from: data) else {
               completion(.failure(.serializationError))
               return
           }
           completion(.success(sheet))
        }
       .resume()
        
    }
    
    private func loadUrlEndDecode() {
        
    }
    
    private func decodejson<T:Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let error {
            print("data has been not decoded : \(error.localizedDescription)")
            return nil
        }
    }
    
    private func executeInMainThread<D:Decodable>(with result: Result<D,SheetError>,completion: @escaping ((Result<D,SheetError>) -> Void) ) {
        DispatchQueue.main.async { completion(result)}
    }
    
}
