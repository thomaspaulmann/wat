//
//  UIView+CornerRadius.swift
//  Wat
//
//  Created by Thomas Paul Mann on 24/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit

extension UILabel {

    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

}