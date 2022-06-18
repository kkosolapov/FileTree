
import Foundation

typealias Sheet = [SheetItem]

extension Sheet {
    
    func getMainLayerOfSheet() -> Sheet {
        return self.filter { $0.parentId == "" }
    }
    
    func getChildItems(by parentId: String) -> Sheet {
        return self.filter { $0.parentId == parentId }
    }
}
