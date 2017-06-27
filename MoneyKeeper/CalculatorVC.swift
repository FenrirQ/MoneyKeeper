//
//  CalculatorVC.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 6/23/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: NotificationKey.calculatorTap, object: nil, userInfo: ["text": sender.titleLabel!.text!])
    }
    
    @IBAction func keyboardButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: NotificationKey.textFieldClick, object: nil)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: NotificationKey.calculatorTap, object: nil, userInfo: ["image": sender.currentImage!])
    }
    
}
