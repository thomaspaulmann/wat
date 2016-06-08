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

    // MARK: - Properties

    private var alchemyLanguage: AlchemyLanguage?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        alchemyLanguage = AlchemyLanguage(apiKey: Credentials.alchemyApiKey)
    }

    override func viewWillAppear(animated: Bool) {
        startObservingKeyboardAppereance()
    }

    override func viewWillDisappear(animated: Bool) {
        stopObservingKeyboardAppereance()
    }

    // MARK: - Actions

    @IBAction func didPressAnalyzeButton(sender: UIButton) {
        alchemyLanguage?.getLanguage(requestType: .Text, html: nil, url: nil, text: textView.text, completionHandler: { (error, language) in
            print(language.language)
        })
    }

}

