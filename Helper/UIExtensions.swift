import UIKit

extension UIViewController {
    public func someWrongAlert(_ controller: UIViewController ,
                               _ title: String ,
                               _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "cancel", style: .destructive, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}
