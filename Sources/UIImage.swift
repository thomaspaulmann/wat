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

    /**
     Draw a Rect on the given Image.

     - parameter rect: The Rect for drawing.

     - returns: Image with Rect on top of it.
     */
    internal func draw(rect: CGRect) -> UIImage {
        UIGraphicsBeginImageContext(self.size)

        let context = UIGraphicsGetCurrentContext()

        self.drawAtPoint(CGPointZero)

        CGContextSetStrokeColorWithColor(context, UIColor(red:0.88, green:0.93, blue:0.00, alpha:1.00).CGColor)
        CGContextSetLineWidth(context, 10.0);
        CGContextAddRect(context, rect)
        CGContextDrawPath(context, .Stroke)

        let imageWithRect = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return imageWithRect
    }

}