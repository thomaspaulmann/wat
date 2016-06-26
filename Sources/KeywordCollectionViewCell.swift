//
//  KeywordCollectionViewCell.swift
//  Wat
//
//  Created by Thomas Paul Mann on 26/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit

class KeywordCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var keywordLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

extension KeywordCollectionViewCell {

    static func reuseIdentifier() -> String {
        return "KeywordCollectionViewCell"
    }

}


