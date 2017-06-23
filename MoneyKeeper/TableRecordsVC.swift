//
//  TableRecordsVC.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 6/22/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class TableRecordsVC: UITableViewController, UITextFieldDelegate {

    
    @IBOutlet weak var moneyTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moneyTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITextFieldDelegate

    func textFieldDidBeginEditing(_ textField: UITextField) {
        NotificationCenter.default.post(name: NotificationKey.textFieldClick, object: nil)
        moneyTextField.resignFirstResponder()
    }
    
}

struct NotificationKey {
    static let textFieldClick = NSNotification.Name.init("textFieldClick")
}
