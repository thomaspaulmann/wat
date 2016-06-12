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

    private var alchemyLanguage: AlchemyLanguageV1?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        alchemyLanguage = AlchemyLanguageV1(apiKey: Credentials.alchemyApiKey)
    }

    // MARK: - Operations

    private func analyzeText(text: String) {
        // TBC: Method to upload text is needed

//        alchemyLanguage?.getEmotionURL("",
//                                       failure: { [weak self] (error) in self?.showAlert() },
//                                       success: { (emotion) in print(emotion) })
    }

    // MARK: - Actions

    @IBAction func didPressAnaylzeButton(sender: UIBarButtonItem) {
        analyzeText(textView.text)
    }

}

