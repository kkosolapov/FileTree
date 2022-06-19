import Foundation

import Foundation

typealias Sheet = [SheetItem]

extension Sheet {
    
    func getMainLayerOfSheet() -> Sheet {
        return self.filter { $0.parentId == "" }
            .sorted { $0.type == .d || $1.type != .d }
    }
    
    func getChildItems(by parentId: String) -> Sheet {
        return self.filter { $0.parentId == parentId }
    }
}
