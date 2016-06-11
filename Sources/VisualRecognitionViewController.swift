//
//  VisualRecognitionViewController.swift
//  Wat
//
//  Created by Thomas Paul Mann on 11/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit
import VisualRecognitionV3

class VisualRecognitionViewController: UIViewController {

    // MARK: - Properties

    private var visualRecogntion: VisualRecognition?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        visualRecogntion = VisualRecognition(apiKey: Credentials.visualRecognitionApiKey, version: Credentials.visualRecognitionVersionDate)

        let failure = { (error: NSError) in print(error) }
        visualRecogntion?.detectFaces("https://upload.wikimedia.org/wikipedia/commons/f/fc/Ryan_Gosling_2_Cannes_2011_(cropped).jpg",
                                      failure: failure) { imagesWithFaces in
            print(imagesWithFaces)
        }
    }

}
