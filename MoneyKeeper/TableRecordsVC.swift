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
    
    var done = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moneyTextField.delegate = self
        registerNotification()
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
    
    
    // create observer for calculator action
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(moneyTextFieldUpdate(_:)), name: NotificationKey.calculatorTap, object: nil)
    }
    
    var calService: CalculatorServices = CalculatorServices()
    
    func moneyTextFieldUpdate(_ notification: Notification) {
        let dict = notification.userInfo!
        let stringValue = String(describing: dict["text"] ?? "")
        let textCurrentOfTextField = moneyTextField.text!
        switch stringValue {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "000":
            if !done {
                moneyTextField.text = textCurrentOfTextField + stringValue
            } else {
                moneyTextField.text = stringValue
                done = false
            }
        case "":
            break
        case "C":
            calService.performOperation("C")
            moneyTextField.text = ""
        default:
            if !done {
                calService.setOperand(Double(textCurrentOfTextField) ?? 0)
                done = true
            }
            calService.performOperation(stringValue)
            if let result = calService.result {
                moneyTextField.text = String(result)
            }
        }
        
        //action for delete button
        if let imageValue = dict["image"] as? UIImage {
            if imageValue.isEqual(UIImage(named: "Delete")) {
                moneyTextField.text = calService.deleteButton(textCurrentOfTextField)
                done = false
            }
        }
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

struct NotificationKey {
    static let textFieldClick = NSNotification.Name.init("textFieldClick")
    static let calculatorTap = NSNotification.Name.init("calculatorTap")
}
