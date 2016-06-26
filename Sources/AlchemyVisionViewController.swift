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
    private let compressionQuality = CGFloat(0.7)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        alchemyVision = AlchemyVision(apiKey: Credentials.alchemyApiKey)
    }

    // MARK: - Operations

    private func choosePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .PhotoLibrary
            imagePicker.editing = false

            self.presentViewController(imagePicker, animated: true, completion: nil)
        } else {
            self.showAlert(withText: "No Photo Library available")
        }
    }

    private func analyze(image: UIImage) {
        if let imageData = UIImageJPEGRepresentation(image, compressionQuality) {
            alchemyVision?.getRankedImageKeywords(image: imageData,
                                                  forceShowAll: true,
                                                  failure: { (error: NSError) in print(error) },
                                                  success: { (imageKeywords: ImageKeywords) in print(imageKeywords) })

            alchemyVision?.getRankedImageFaceTags(image: imageData,
                                                  failure: { [weak self] (error: NSError) in  self?.showAlert() },
                                                  success: { [weak self] (faceTags: FaceTags) in
                                                    if let face = faceTags.imageFaces.first {
                                                        self?.draw(face, on: image)
                                                    }
            })
        }
    }

    private func draw(face: ImageFace, on image: UIImage) {
        let rect = CGRect(x: face.positionX, y: face.positionY, width: face.width, height: face.height)

        imageView.image = image.draw(rect)
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

        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = image
            analyze(image)
        }
    }

}
