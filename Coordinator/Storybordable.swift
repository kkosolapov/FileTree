import UIKit

protocol Storybordable {
    static func createObject() -> Self
}

extension Storybordable where Self: UIViewController {
    static func createObject() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
