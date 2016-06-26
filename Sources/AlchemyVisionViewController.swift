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
    @IBOutlet weak var keywordCollectionView: UICollectionView!

    // MARK: - Properties

    private var alchemyVision: AlchemyVision?
    private let compressionQuality = CGFloat(0.7)
    private var imageKeywords: [ImageKeyword]? {
        didSet {
            self.keywordCollectionView.reloadData()
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        alchemyVision = AlchemyVision(apiKey: Credentials.alchemyApiKey)
        keywordCollectionView.dataSource = self
        keywordCollectionView.delegate = self
        keywordCollectionView.registerNib(KeywordCollectionViewCell.reuseIdentifier())
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
                                                  failure: { [weak self] (error: NSError) in
                                                    self?.showAlert(withText: "Something went wrong for the Keyword Extraction")
                },
                                                  success: { [weak self] (imageKeywords: ImageKeywords) in
                                                    self?.imageKeywords = imageKeywords.imageKeywords
            })

            alchemyVision?.getRankedImageFaceTags(image: imageData,
                                                  failure: { [weak self] (error: NSError) in
                                                    self?.showAlert(withText: "Something went wrong for the Face Detection")
                },
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

// MARK: - Data Source

extension AlchemyVisionViewController: UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageKeywords?.count ?? 0
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let
            cell = collectionView.dequeueReusableCellWithReuseIdentifier(KeywordCollectionViewCell.reuseIdentifier(), forIndexPath: indexPath) as? KeywordCollectionViewCell,
            keywords = imageKeywords
        else {
            return UICollectionViewCell()
        }

        cell.keywordLabel.text = keywords[indexPath.item].text.capitalizedString

        return cell
    }

}

// Flow Layout Delegate

extension AlchemyVisionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        guard let keyword = imageKeywords?[indexPath.item].text else {
            return CGSizeZero
        }

        return sizeForCell(withText: keyword)
    }

    private func sizeForCell(withText text: String) -> CGSize {
        let size = NSString(string: text).sizeWithAttributes(nil)

        return CGSize(width: size.width + 30.0, height: 30.0)
    }

}
