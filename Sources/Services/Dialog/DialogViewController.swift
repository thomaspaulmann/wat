//
//  DialogViewController.swift
//  Wat
//
//  Created by Thomas Paul Mann on 11/06/16.
//  Copyright © 2016 Thomas Paul Mann. All rights reserved.
//

import UIKit
import DialogV1

class DialogViewController: UIViewController {

    // TODO: Extract hard coded strings
    // TODO: Add chat interface for communication

    // MARK: - Properties

    private var dialog: Dialog?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        dialog = Dialog(username: Credentials.dialogUsername, password: Credentials.dialogPassword)

        guard let fileURL = loadDialogFile("pizza", withExtension: "xml") else {
            showAlert(withText: "Could not load Dialog File!")
            return
        }

        let failure = { [weak self] (error: NSError) -> Void in self?.showAlert() }
        let success = { (dialogId: DialogID) -> Void in print(dialogId) }

        dialog?.createDialog("wat",
                             fileURL: fileURL,
                             failure: failure,
                             success: success)
    }

    // MARK: - File Access

    func loadDialogFile(name: String, withExtension: String) -> NSURL? {
        let bundle = NSBundle(forClass: self.dynamicType)

        guard let url = bundle.URLForResource(name, withExtension: withExtension) else {
            return nil
        }

        return url
    }

}
