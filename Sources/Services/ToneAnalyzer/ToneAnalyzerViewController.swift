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

    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var analyzeButtonBottomConstraint: NSLayoutConstraint!

    // MARK: - Properties

    private var toneAnalyzer: ToneAnalyzer?
    private let versionDate = "2016-06-11"

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        toneAnalyzer = ToneAnalyzer(username: Credentials.toneAnalyzerUsername, password: Credentials.toneAnalyzerPassword, version: versionDate)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        startKeyboardObservation()
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)

        stopKeyboardObservation()
    }

    // MARK: - Keyboard Observation

    override func bottomConstraint() -> NSLayoutConstraint? {
        return analyzeButtonBottomConstraint
    }

    // MARK: - Actions

    @IBAction func didPressAnalyzeButton(sender: UIButton) {
        toneAnalyzer?.getTone(textView.text,
                              failure: { (error) in print(error) },
                              success: { (toneAnalysis) in print(toneAnalysis) })
    }

}
