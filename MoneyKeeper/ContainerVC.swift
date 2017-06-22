//
//  ContainerVC.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 6/21/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    
    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var coverButton: UIButton!
    @IBOutlet weak var menuContainerView: UIView!
    @IBOutlet weak var calculatorContainerView: UIView!
    
    @IBOutlet weak var topMenuConstraint: NSLayoutConstraint!
    
    
    
    var isMenuViewOpen: Bool = true {
        didSet {
            if isMenuViewOpen {
                constraintForMenuViewClose()
                UIView.animate(withDuration: 0.1, animations: {self.view.layoutIfNeeded()})
            } else {
                constraintForMenuViewOpen()
                UIView.animate(withDuration: 0.2, animations: {self.view.layoutIfNeeded()})
            }
        }
    }
    
    func constraintForMenuViewOpen() {
        topMenuConstraint.constant = 0
        coverButton.alpha = 0.3
    }
    
    func constraintForMenuViewClose() {
        topMenuConstraint.constant = -menuContainerView.bounds.height
        coverButton.alpha = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func changeConstrainStatus(_ sender: UIButton) {
        isMenuViewOpen = !isMenuViewOpen
    }
    
    
    
    @IBAction func menuButtonDown(_ sender: UIButton) {
        changeConstrainStatus(sender)
    }

}
