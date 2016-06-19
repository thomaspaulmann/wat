//
//  VisualRecognitionViewController.swift
//  Wat
//
//  Created by Thomas Paul Mann on 11/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit
import VisualRecognitionV3

class VisualRecognitionViewController: UIViewController, UINavigationControllerDelegate {

    // MARK: - Outlets

    @IBOutlet weak var imageView: UIImageView!

    // MARK: - Properties

    private var visualRecogntion: VisualRecognition?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        visualRecogntion = VisualRecognition(apiKey: Credentials.visualRecognitionApiKey, version: Credentials.visualRecognitionVersionDate)
    }

    private func choosePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .PhotoLibrary
            imagePicker.editing = false

            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }

    private func analyzeImage(image: UIImage) {
        // TBC: Visual Recognition needs possibility to upload image for analyzing
    }

    // MARK: - Actions

    @IBAction func didPressChoosePhotoButton(sender: UIButton) {
        choosePhoto()
    }

}

// MARK: - Image Picker Delegate

extension VisualRecognitionViewController: UIImagePickerControllerDelegate {

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)

        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
            analyzeImage(image)
        }
    }
    
}