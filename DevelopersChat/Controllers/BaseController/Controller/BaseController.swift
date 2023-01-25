//
//  BaseController.swift
//  DevelopersChat
//
//  Created by Mandeep Singh on 25/01/23.
//

import UIKit

class BaseController: UIViewController {
    
    var baseVM: BaseVM? {
       didSet {
           initBaseModel()
       }
   }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Cann't be override by subclass
   final func initBaseModel() {
       // Native binding
       baseVM?.showAlertClosure = { [weak self] () in
           DispatchQueue.main.async {
               if let message = self?.baseVM?.alertMessage {
                   if message.count > 0 {
                       SwiftAlert.show(self, title: "", message: message)
                   }
               }
           }
       }
       
       baseVM?.updateLoadingStatus = { [weak self] () in
           guard let `self` = self else { return }
           let isLoaidng = self.baseVM?.isLoading ?? false
//           let _ = isLoaidng ? self.showLoader() : self.hideLoader()
       }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
