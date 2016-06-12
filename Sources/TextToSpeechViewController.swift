//
//  TextToSpeechViewController.swift
//  Wat
//
//  Created by Thomas Paul Mann on 11/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit
import TextToSpeechV1
import AVFoundation

class TextToSpeechViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var speakButtonBottomConstraint: NSLayoutConstraint!
    
    // MARK: - Properties

    private var textToSpeech: TextToSpeech?
    private var audioPlayer: AVAudioPlayer?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        textToSpeech = TextToSpeech(username: Credentials.textToSpeechUsername, password: Credentials.textToSpeechPassword)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        startKeyboardObservation()
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)

        stopKeyboardObservation()
    }

    // MARK: - Logic
    
    private func playAudio(fromData data: NSData) {
        do {
            audioPlayer = try AVAudioPlayer(data: data)
            audioPlayer?.play()
        } catch let error {
            print(error)
        }
    }

    // MARK: - Keyboard Observation

    override func bottomConstraint() -> NSLayoutConstraint? {
        return speakButtonBottomConstraint
    }

    // MARK: - Actions

    @IBAction func didPressSpeakButton(sender: UIButton) {
        let failure = { [weak self] (error: NSError) -> Void in self?.showAlert() }
        let success = { [weak self] (data: NSData) -> Void in self?.playAudio(fromData: data) }

        textToSpeech?.synthesize(textView.text,
                                 failure: failure,
                                 success: success)
    }

}