//
//  PersonalityInsightsViewController.swift
//  Wat
//
//  Created by Thomas Paul Mann on 11/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit
import PersonalityInsightsV2

class PersonalityInsightsViewController: UIViewController {

    // MARK: - Properties

    private var personalityInsights: PersonalityInsights?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        personalityInsights = PersonalityInsights(username: Credentials.personalityInsightsUsername, password: Credentials.personalityInsightsPassword)

        let failure = { (error: NSError) in print(error) }

        personalityInsights?.getProfile(text: "Some text here",
                                       failure: failure) { profile in
                                        print(profile)
        }
    }

}
