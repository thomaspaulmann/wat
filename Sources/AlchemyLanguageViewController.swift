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

//    let failureClosure: (NSError) -> (Void) = { error in
//        print(error)
//
////        MILAlertViewManager.sharedInstance.show(.Classic, text: "MILAlertView Test!", callback: {
////            print("callback")
////        })
//
//        MILAlertViewManager.sharedInstance.show(.Classic,
//                                                text: "Alert!",
//                                                textColor: nil,
//                                                textFont: nil,
//                                                backgroundColor: nil,
//                                                reloadImage: nil,
//                                                inView: self.view,
//                                                underView: nil,
//                                                toHeight: nil,
//                                                forSeconds: nil,
//                                                callback: nil)
//    }

    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!

    // MARK: - Properties

    private var alchemyLanguage: AlchemyLanguageV1?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        alchemyLanguage = AlchemyLanguageV1(apiKey: Credentials.alchemyLanguageApiKey)
    }

    // MARK: - Actions

    @IBAction func didPressAnaylzeButton(sender: UIBarButtonItem) {
        alchemyLanguage?.getEmotionURL("",
                                       failure: { [weak self] (error) in
                                        MILAlertViewManager.sharedInstance.show(.Classic,
                                            text: "Ups... Something went wrong",
                                            inView: self?.view,
                                            toHeight: 64,
                                            callback: nil)
            },
                                       success: { (emotion) in
            print(emotion)
        })
    }

}

