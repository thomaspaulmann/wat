//
//  SpeechToTextViewController.swift
//  Wat
//
//  Created by Thomas Paul Mann on 11/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit
import SpeechToTextV1

class SpeechToTextViewController: UIViewController {

    // MARK: - Properties

    private var speechToText: SpeechToText?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        speechToText = SpeechToText(username: Credentials.speechToTextUsername, password: Credentials.speechToTextPassword)

        var settings = TranscriptionSettings(contentType: .L16(rate: 44100, channels: 1))
        settings.continuous = true
        settings.interimResults = true

        let failure = { (error: NSError) in print(error) }

        let stopStreaming = speechToText?.transcribe(settings,
                                                    failure: failure) { results in
                                                        if let transcription = results.last?.alternatives.last?.transcript {
                                                            print(transcription)
                                                        }
        }
    }

}
