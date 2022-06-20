import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
    func goToDetail(_ item: SheetItem)
    func goToMainVC(_ datasourse: Sheet , _ bataBase: Sheet)
}
