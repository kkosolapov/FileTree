import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
    func goToDetail(_ item: SheetItem)
    func goToMainVC(title: String,
                    datasourse: Sheet ,
                    dataBase: Sheet)
}
