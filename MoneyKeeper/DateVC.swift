//
//  DateVC.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 7/9/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class DateVC: UIViewController {

    
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var timePickerView: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func todayAction(_ sender: UIButton) {
        
    }
    
    
    @IBAction func completeAction(_ sender: UIButton) {
        
    }
    
    
}

extension TableRecordsVC: UIPopoverPresentationControllerDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "goToDate":
            guard let dateVC = segue.destination as? DateVC else {return}
            dateVC.popoverPresentationController?.delegate = self
            dateVC.preferredContentSize = CGSize(width: 375, height: 400)
            dateVC.popoverPresentationController?.sourceView = self.view
            dateVC.popoverPresentationController?.sourceRect = CGRect(x: 0, y: view.frame.height-400, width: 0, height: 0)
        default:
            return
        }
    }
    
//    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
//        return UIModalPresentationStyle.currentContext
//    }
}
