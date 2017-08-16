//
//  MainTabbarController.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 8/15/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard UserDefaults.standard.bool(forKey: "isLogin") else {
            performSegue(withIdentifier: "goToTutorial", sender: self)
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func unwindToMain(_ segue: UIStoryboardSegue) {
        UserDefaults.standard.set(true, forKey: "isLogin")
    }
    

}
