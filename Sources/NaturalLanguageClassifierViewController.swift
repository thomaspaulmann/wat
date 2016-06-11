//
//  NaturalLanguageClassifierViewController.swift
//  Wat
//
//  Created by Thomas Paul Mann on 11/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit
import NaturalLanguageClassifierV1

class NaturalLanguageClassifierViewController: UIViewController {

    // TODO: Code example

    // MARK: - Properties

    private var naturalLanguageClassifier: NaturalLanguageClassifier?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        naturalLanguageClassifier = NaturalLanguageClassifier(username: Credentials.naturalLanguageClassifierUsername, password: Credentials.naturalLanguageClassifierPassword)

//        let failure = { (error: NSError) in print(error) }
//        naturalLanguageClassifier?.classify(self.classifierIdInstanceId,
//                                           text: "is it sunny?",
//                                           failure: failure) { classification in
//                                            // code here
//        }
    }

}
