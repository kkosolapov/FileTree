import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        let vc = MainViewController.createObject()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
  
    func goToDetail(_ item: SheetItem) {
        let vc = DetailViewController.createObject()
        vc.coordinator = self
        vc.item = item
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToMainVC(title: String,datasourse: Sheet ,dataBase: Sheet) {
        let vc = MainViewController.createObject()
        vc.coordinator = self
        vc.title = String(title.split(separator: ".").first ?? "File")
        vc.dataSourse = datasourse.getSortedSheet()
        vc.dataBace = dataBase
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}
