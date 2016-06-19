//
//  ServicesTableViewController.swift
//  Wat-iOS
//
//  Created by Thomas Paul Mann on 08/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit

class ServicesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Workaround to remove empty cells
        self.tableView.tableFooterView = UIView()
    }

}
