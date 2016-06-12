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

    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!
    
    // MARK: - Properties

    private var speechToText: SpeechToText?
    private lazy var speechToTextSettings: TranscriptionSettings = {
        var settings = TranscriptionSettings(contentType: .L16(rate: 44100, channels: 1))
        settings.continuous = true
        settings.interimResults = true

        return settings
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        speechToText = SpeechToText(username: Credentials.speechToTextUsername, password: Credentials.speechToTextPassword)
    }

    // MARK: - Actions

    @IBAction func didPressButton(sender: UIButton) {
        let successCompletion = { [weak self] (result: [TranscriptionResult]) in
            if let transcription = result.last?.alternatives.last?.transcript {
                self?.textView.text = transcription
            }
        }

        let _ = speechToText?.transcribe(speechToTextSettings, success:successCompletion)
    }

}
