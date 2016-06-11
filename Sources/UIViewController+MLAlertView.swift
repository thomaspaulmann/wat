//
//  UIViewController+MLAlertView.swift
//  Wat
//
//  Created by Thomas Paul Mann on 11/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit

extension UIViewController {

    func showAlert(withText text: String? = nil, callback: (()->())? = nil) {
        MILAlertViewManager.sharedInstance.show(.Classic,
                                                text: text ?? "Ups... Something went wrong",
                                                inView: self.view,
                                                toHeight: 64,
                                                callback: callback)
    }

}
