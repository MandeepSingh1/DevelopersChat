

import Foundation
import UIKit

struct AlertAction {
    let title: String?
    let style: UIAlertAction.Style
    init(_ title:String, _ style:UIAlertAction.Style = .default) {
        self.title = title
        self.style = style
    }
}

typealias AlertHandler = (_ index:Int) -> Void

struct SwiftAlert {
    
    public static func show(_ presenter:UIViewController?, title:String?, message:String?, handler:AlertHandler? = nil) {
        self.show(presenter, title: title, message: message, preferredStyle: .alert, options: [AlertAction("OK")], handler: handler)
    }
    
    public static func show(_ presenter:UIViewController?, title: String?, message: String?, preferredStyle: UIAlertController.Style, options: [AlertAction], handler:AlertHandler?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alert.addAction(UIAlertAction.init(title: option.title, style: option.style, handler: { (action) in
                handler?(index)
            }))
        }
        DispatchQueue.main.async {
            presenter?.present(alert, animated: true, completion: nil)
        }
    }
}
