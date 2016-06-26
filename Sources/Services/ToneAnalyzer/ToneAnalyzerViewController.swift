//
//  ToneAnalyzerViewController.swift
//  Wat-iOS
//
//  Created by Thomas Paul Mann on 08/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit
import ToneAnalyzerV3

class ToneAnalyzerViewController: UIViewController {

    // MARK: - Properties

    private var toneAnalyzer: ToneAnalyzer?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        toneAnalyzer = ToneAnalyzer(username: Credentials.toneAnalyzerUsername, password: Credentials.toneAnalyzerPassword, version: Credentials.toneAnalyzerVersionDate)
    }

}
