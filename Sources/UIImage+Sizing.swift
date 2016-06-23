//
//  UIImage+Sizing.swift
//  Wat
//
//  Created by Thomas Paul Mann on 23/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit

internal extension UIImage {

    /**
     Scale image to a specified Size.

     - parameter newSize: The new Size for the Image.

     - returns: Resized Image that matches the specified Size.
     */
    internal func scale(to newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(newSize)

        self.drawInRect(CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return scaledImage
    }

}