//
//  LanguageTranslationViewController.swift
//  Wat
//
//  Created by Thomas Paul Mann on 11/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit
import LanguageTranslationV2

class LanguageTranslationViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var translateButtonBottomConstraint: NSLayoutConstraint!

    // MARK: - Properties

    private var languageTranslation: LanguageTranslation?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        languageTranslation = LanguageTranslation(username: Credentials.languageTranslationUsername, password: Credentials.languageTranslationPassword)
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

        languageTranslation?.translate(text,
                                       source: "en",
                                       target: "fr",
                                       failure: { (error: NSError) in print(error) },
                                       success: { [weak self] (response) in
                                        self?.outputTextView.text = response.translations.last?.translation
            })
    }

    // MARK: - Actions

    @IBAction func didPressTranslateButton(sender: UIButton) {
        translate(inputTextView.text)
    }
}
