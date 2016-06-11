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

    // MARK: - Properties

    private var languageTranslation: LanguageTranslation?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        languageTranslation = LanguageTranslation(username: Credentials.languageTranslationUsername, password: Credentials.languageTranslationPassword)

        languageTranslation?.translate(["Hello"],
                                       source: "en",
                                       target: "es",
                                       failure: { (error: NSError) in print(error) },
                                       success: { (response) in print(response.translations) })
    }

}
