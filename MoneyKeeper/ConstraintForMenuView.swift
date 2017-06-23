//
//  ConstraintForMenuView.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 6/22/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

extension ContainerVC {
    
    func constraintForMenuViewOpen() {
        topMenuConstraint.constant = 0
        coverButton.alpha = 0.3
    }
    
    func constraintForMenuViewClose() {
        topMenuConstraint.constant = -menuContainerView.bounds.height
        coverButton.alpha = 0
    }
    
    @IBAction func changeMenuConstrainStatus(_ sender: UIButton) {
        isMenuViewOpen = !isMenuViewOpen
    }
    
    @IBAction func menuButtonDown(_ sender: UIButton) {
        changeMenuConstrainStatus(sender)
    }
    
}
