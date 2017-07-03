//
//  RedVC.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 7/1/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class RedVC: UIViewController {

    //get View from storyboard
    static var instance: RedVC {
        let storyboard = UIStoryboard(name: "Records", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "RedVC") as! RedVC
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.post(name: NotificationKey.setTitleMenuButton, object: nil, userInfo: ["rowName":"Thu tiền"])
    }

}
