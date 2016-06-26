//
//  UIViewController+MLAlertView.swift
//  Wat
//
//  Created by Thomas Paul Mann on 11/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit

extension UIViewController {

    // MARK: - Alert

    func showAlert(withText text: String? = nil, callback: (()->())? = nil) {
        MILAlertViewManager.sharedInstance.show(.Classic,
                                                text: text ?? "Ups... Something went wrong",
                                                inView: self.view,
                                                callback: callback)
    }

    // MARK: - Keyboard Observation

    func startKeyboardObservation() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(UIViewController.animateWithKeyboard(_:)), name: UIKeyboardWillShowNotification, object: nil)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(UIViewController.animateWithKeyboard(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }

    func stopKeyboardObservation() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    func animateWithKeyboard(notification: NSNotification) {
        guard let
            constraint = bottomConstraint(),
            userInfo = notification.userInfo,
            keyboardHeight = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue().height,
            duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double
            else {
                return
        }

        constraint.constant = (notification.name == UIKeyboardWillShowNotification) ? keyboardHeight : 0

        UIView.animateWithDuration(duration, animations: { self.view.layoutIfNeeded() })
    }

    // Override this method to provide your own Constraint
    func bottomConstraint() -> NSLayoutConstraint? {
        return nil
    }


}
