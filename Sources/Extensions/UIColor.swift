//
//  UIColor.swift
//  Wat
//
//  Created by Thomas Paul Mann on 26/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit

extension UIColor {

    // MARK: - Text Colors

    static func textColor() -> UIColor {
        return UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.00)
    }

    static func secondaryTextColor() -> UIColor {
        return UIColor(red:0.69, green:0.69, blue:0.69, alpha:1.00)
    }

    // MARK: - Background Colors

    static func backgroundColor() -> UIColor {
        return UIColor(red:0.09, green:0.14, blue:0.20, alpha:1.00)
    }

    static func lighterBackgroundColor() -> UIColor {
        return UIColor(red:0.15, green:0.19, blue:0.25, alpha:1.00)
    }

    // MARK: - Other Colors

    static func accentColor() -> UIColor {
        return UIColor(red:0.88, green:0.93, blue:0.00, alpha:1.00)
    }

    static func hightlightColor() -> UIColor {
        return UIColor(red:0.42, green:0.55, blue:0.64, alpha:1.00)
    }

    static func errorColor() -> UIColor {
        return UIColor(red:0.91, green:0.00, blue:0.23, alpha:1.00)
    }

}
