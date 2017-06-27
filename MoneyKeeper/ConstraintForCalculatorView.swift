//
//  ConstraintForCalculatorView.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 6/22/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

extension ContainerVC {
    
    
    func constraintForCalculatorViewOpen() {
        bottomCalcuConstraint.constant = 0
        coverButton.alpha = 0
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func constraintForCalculatorViewClose() {
        bottomCalcuConstraint.constant = -calculatorContainerView.bounds.height
        coverButton.alpha = 0
        tabBarController?.tabBar.isHidden = false
    }
    
    func calculatorViewUp() {
        isCalculatorViewOpen = !isCalculatorViewOpen
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(calculatorViewUp), name: NotificationKey.textFieldClick, object: nil)
    }
    
    
}
