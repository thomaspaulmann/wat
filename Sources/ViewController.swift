//
//  ViewController.swift
//  ToneAnalyzer-iOS
//
//  Created by Thomas Paul Mann on 07/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit
import ToneAnalyzerV3

class ViewController: UIViewController {

    // MARK: - Outlet

    @IBOutlet weak var textView: UITextView!

    // MARK: - Properties

    private let failureHandler = { (error: NSError) in
        print(error)
    }

    private lazy var dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        return formatter
    }()

    private var toneAnalyzer: ToneAnalyzer?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Init Tone Analyzer
        let today = dateFormatter.stringFromDate(NSDate())
        toneAnalyzer = ToneAnalyzer(username: Credentials.username, password: Credentials.password, version: today)
    }

    // MARK: - Actions

    @IBAction func didPressAnalyzeButton(sender: UIButton) {
        // Analyze text
        toneAnalyzer?.getTone(textView.text, failure: failureHandler) { responseTone in
            print(responseTone.documentTone)
        }
    }

}

