//
//  ViewController.swift
//  ToneAnalyzer-iOS
//
//  Created by Thomas Paul Mann on 07/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit
import AlchemyLanguageV1

class AlchemyLanguageViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var analyzeButtonBottomConstraint: NSLayoutConstraint!

    // MARK: - Properties

    private var alchemyLanguage: AlchemyLanguageV1?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        alchemyLanguage = AlchemyLanguageV1(apiKey: Credentials.alchemyApiKey)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        startKeyboardObservation()
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)

        stopKeyboardObservation()
    }

    // MARK: - Logic

    private func analyzeText(text: String) {
        // TBC: Alchemy Language needs possibility to upload plain text for analyzing
    }

    // MARK: - Keyboard Observation

    override func bottomConstraint() -> NSLayoutConstraint? {
        return analyzeButtonBottomConstraint
    }

    // MARK: - Actions

    @IBAction func didPressAnalyzeButton(sender: UIButton) {
        analyzeText(textView.text)
    }

}

