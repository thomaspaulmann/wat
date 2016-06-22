//
//  AlchemyVisionViewController.swift
//  Wat
//
//  Created by Thomas Paul Mann on 11/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit
import AlchemyVisionV1

class AlchemyVisionViewController: UIViewController, UINavigationControllerDelegate {

    // MARK: - Outlets

    @IBOutlet weak var imageView: UIImageView!

    // MARK: - Properties

    private var alchemyVision: AlchemyVision?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        alchemyVision = AlchemyVision(apiKey: Credentials.alchemyApiKey)
    }

    // MARK: - Operations

    private func choosePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .Camera
            imagePicker.editing = false

            self.presentViewController(imagePicker, animated: true, completion: nil)
        } else {
            self.showAlert(withText: "No Camera available")
        }
    }

    private func analyze(image: UIImage) {
        let failure = { [weak self] (error: NSError) -> Void in self?.showAlert() }
        let success = { (faceTags: FaceTags) -> Void in print(faceTags) }

        if let imageData = UIImagePNGRepresentation(image) {
            alchemyVision?.getRankedImageFaceTags(image: imageData,
                                                  failure: failure,
                                                  success: success)
        }
    }

    // MARK: - Actions

    @IBAction func didPressChoosePhotoButton(sender: UIButton) {
        choosePhoto()
    }
    
}

// MARK: - Image Picker Delegate

extension AlchemyVisionViewController: UIImagePickerControllerDelegate {

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)

        if let
            image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = image
            analyze(image)
        }
    }

}
