//
//  PageViewController.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 7/1/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    var modelController = BasePageModelController()
    var startViewControllerIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = modelController
        
        if let startingViewController: UIViewController = modelController.viewControllerAt(index: startViewControllerIndex) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func jump(toIndex: Int) {
        guard toIndex != NSNotFound && toIndex >= 0 else {return}
        if let viewController = modelController.viewControllerAt(index: toIndex) {
            setViewControllers([viewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
}



extension PageViewController: MenuTableProtocol {
    
    func passIndexFromCell(index: Int) {
        jump(toIndex: index)
    }
}
