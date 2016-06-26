//
//  ServiceTableViewCell.swift
//  Wat
//
//  Created by Thomas Paul Mann on 23/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {

    // MARK: - Properties

    private let selectedBackgroundColor = UIColor.lightBackgroundColor()

    // MARK: - Selection

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.backgroundColor = selected ? selectedBackgroundColor : .clearColor()
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.backgroundColor = selectedBackgroundColor

        super.touchesBegan(touches, withEvent: event)
    }

    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        self.backgroundColor = .clearColor()

        super.touchesCancelled(touches, withEvent: event)
    }

}
