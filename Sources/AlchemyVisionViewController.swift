//
//  AlchemyVisionViewController.swift
//  Wat
//
//  Created by Thomas Paul Mann on 11/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit
import AlchemyVisionV1

class AlchemyVisionViewController: UIViewController {

    // MARK: - Properties

    private var alchemyVision: AlchemyVision?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        alchemyVision = AlchemyVision(apiKey: Credentials.alchemyApiKey)
    }

    // MARK: - Actions

    @IBAction func didPressAnalyzeButton(sender: UIBarButtonItem) {
        alchemyVision?.getRankedImageKeywords(
            image: NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/7/7e/Thomas_J_Watson_Sr.jpg")!,
            failure: { [weak self] (error) in self?.showAlert() },
            success: { (imageKeywords) in print(imageKeywords) })
    }
    
}
