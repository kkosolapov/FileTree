import UIKit

class DetailViewController: UIViewController, Storybordable {
    
    weak var coordinator: AppCoordinator?
    
    static let id = "DetailViewController"
    
    var item: SheetItem? {
        didSet {
            print(item!)
        }
    }
    
    
    
    var titleText = "" {
        didSet {title =  titleText}
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       print("detail")
    }
 
}
