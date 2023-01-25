//
//  BaseVM.swift
//  DevelopersChat
//
//  Created by Mandeep Singh on 25/01/23.
//

import Foundation

class BaseVM: NSObject {

    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    var isSuccess: Bool? {
        didSet {
            if isSuccess ?? false {
                self.redirectControllerClosure?()
            }
        }
    }
    
    var serverValidations:String? {
       didSet {
        self.serverErrorMessages?(self.serverValidations)
       }
    }
    
    var passObject:AnyObject? {
      didSet {
        DispatchQueue.main.async {
            self.passToViewControllers?(self.passObject)
        }
      }
    }
    
    var showAlertClosure: (() -> Void)?
    var updateLoadingStatus: (() -> Void)?
    var reloadListViewClosure: (() -> Void)?
    var redirectControllerClosure: (() -> Void)?
    var serverErrorMessages: ((_ message: String?) -> Void)?
    var mediaClosures: ((_ status: Bool) -> Void)?
    var passToViewControllers: ((_ status: AnyObject?) -> Void)?
    var passDataVC: ((_ status: AnyObject?) -> Void)?

}
