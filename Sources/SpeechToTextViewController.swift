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
    private var stopListening: SpeechToText.StopStreaming?
    private lazy var speechToTextSettings: TranscriptionSettings = {
        var settings = TranscriptionSettings(contentType: .L16(rate: 44100, channels: 1))
        settings.continuous = true
        settings.interimResults = true
        settings.inactivityTimeout = 5

        return settings
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        speechToText = SpeechToText(username: Credentials.speechToTextUsername, password: Credentials.speechToTextPassword)
    }

    // MARK: - Actions

    @IBAction func didPressListeningButton(button: UIButton) {
        let failure = { [weak self] (error: NSError) -> Void in self?.showAlert() }
        let success = { [weak self] (result: [TranscriptionResult]) in
            if let transcription = result.last?.alternatives.last?.transcript {
                self?.textView.text = transcription
            }
        }

        stopListening = speechToText?.transcribe(speechToTextSettings,
                                     failure: failure,
                                     success:success)
    }

    @IBAction func didReleaseListeningButton(button: UIButton) {
        stopListening?()
    }
}
