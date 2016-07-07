//
//  LanguageTranslationViewController.swift
//  Wat
//
//  Created by Thomas Paul Mann on 11/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit
import LanguageTranslatorV2

class LanguageTranslationViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var translateButtonBottomConstraint: NSLayoutConstraint!

    // MARK: - Properties

    private var languageTranslator: LanguageTranslator?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        languageTranslator = LanguageTranslator(username: Credentials.languageTranslationUsername, password: Credentials.languageTranslationPassword)
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
        return translateButtonBottomConstraint
    }

    // MARK: - Operations

    private func translate(text: String) {
        let failure = { [weak self] (error: NSError) -> Void in self?.showAlert() }
        let success = { [weak self] (response: TranslateResponse) -> Void in
            self?.outputTextView.text = response.translations.last?.translation
        }

        languageTranslator?.translate(text,
                                       source: "en",
                                       target: "fr",
                                       failure: failure,
                                       success: success)
    }

    // MARK: - Actions

    @IBAction func didPressTranslateButton(sender: UIButton) {
        translate(inputTextView.text)
    }
}
