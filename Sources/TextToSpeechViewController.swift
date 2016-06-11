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

    // MARK: - Properties

    private var textToSpeech: TextToSpeech?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        textToSpeech = TextToSpeech(username: Credentials.textToSpeechUsername, password: Credentials.textToSpeechPassword)

        let failure = { (error: NSError) in print(error) }
        textToSpeech?.synthesize("Hello World", failure: failure) { [weak self] data in
            self?.playAudio(fromData: data)
        }
    }

    func playAudio(fromData data: NSData) {
        do {
            let audioPlayer = try AVAudioPlayer(data: data)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let error {
            print(error)
        }
    }
}
