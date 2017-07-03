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
    @IBOutlet weak var bottomCalcuConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var menuButton: UIButton!
    
    var pageViewController: PageViewController?
    var menuTableVC: MenuTableVC?
    
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
    
    var isCalculatorViewOpen: Bool = true {
        didSet {
            if isCalculatorViewOpen {
                constraintForCalculatorViewClose()
                UIView.animate(withDuration: 0.1, animations: {self.view.layoutIfNeeded()})
            } else {
                constraintForCalculatorViewOpen()
                UIView.animate(withDuration: 0.2, animations: {self.view.layoutIfNeeded()})
            }
        }
    }
    
    // MARK: LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotification()
        registerNotificationForPageView()
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "EmbedMenuSide":
            menuTableVC = segue.destination as? MenuTableVC
        case "EmbedPage":
            pageViewController = segue.destination as? PageViewController
        default:
            return
        }
        menuTableVC?.delegate = pageViewController
    }
    
}
