//
//  UIViewController+Keyboard.swift
//  Wat
//
//  Created by Thomas Paul Mann on 12/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit

extension UIViewController {

    func startKeyboardObservation() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LanguageTranslationViewController.animateWithKeyboard(_:)), name: UIKeyboardWillShowNotification, object: nil)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LanguageTranslationViewController.animateWithKeyboard(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }

    func stopKeyboardObservation() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    // Inspiration: http://stackoverflow.com/questions/25693130/move-textfield-when-keyboard-appears-swift
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

        UIView.animateWithDuration(duration,
                                   animations: { self.view.layoutIfNeeded() })
    }

    // Override this method to provide your own Constraint
    func bottomConstraint() -> NSLayoutConstraint? {
        return nil
    }

}