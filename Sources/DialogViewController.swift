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
    private var dialogId: DialogID?
    private var conversationID: Int?
    private var clientID: Int?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        dialog = Dialog(username: Credentials.dialogUsername, password: Credentials.dialogPassword)

        guard let fileURL = loadDialogFile("pizza", withExtension: "xml") else {
            showAlert(withText: "Could not load Dialog File!")
            return
        }

        let userDefaults = NSUserDefaults.standardUserDefaults()

        if let id = userDefaults.objectForKey("dialog-id") as? DialogID {
            dialogId = id
            print("Dialog loaded with ID \(dialogId)")
        } else {
            dialog?.createDialog("wat",
                                 fileURL: fileURL,
                                 failure: { [weak self] (error) in
                                    self?.showAlert()
                                    print(error)
                },
                                 success: { [weak self] (dialogId) in
                                    userDefaults.setValue(dialogId, forKey: "dialog-id")
                                    self?.dialogId = dialogId
                                    print("New dialog created with ID \(dialogId)")
                })
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let failure = { (error: NSError) in print(error) }
        dialog!.converse(dialogId!,
                        failure: failure) { [weak self] conversationResponse in
                            // save conversation parameters
                            self?.conversationID = conversationResponse.conversationID
                            self?.clientID = conversationResponse.clientID
                            
                            // print message from Watson
                            print(conversationResponse.response)
        }
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
