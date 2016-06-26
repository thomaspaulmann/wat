//
//  UICollectionView.swift
//  Wat
//
//  Created by Thomas Paul Mann on 26/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit

extension UICollectionView {

    func registerNib(nibName: String) {
        let nib: UINib? = UINib(nibName: nibName, bundle: NSBundle.mainBundle())
        self.registerNib(nib, forCellWithReuseIdentifier: nibName)
    }

}
