//
//  BaseModelController.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 7/1/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class BasePageModelController: NSObject, UIPageViewControllerDataSource {
    
    var viewControllers: [UIViewController] = [TableRecordsVC.instance, GreenVC.instance, RedVC.instance, BlueVC.instance]
    
    //Get Data View Controller for the given index
    func viewControllerAt(index: Int) -> UIViewController? {
        if self.viewControllers.count == 0 || index >= self.viewControllers.count || index < 0 || index == NSNotFound {
            return nil
        }
        return viewControllers[index]
    }
    
    func indexOf(viewController: UIViewController) -> Int {
        return viewControllers.index(of: viewController) ?? NSNotFound
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = indexOf(viewController: viewController)
        return viewControllerAt(index: index - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = indexOf(viewController: viewController)
        return viewControllerAt(index: index + 1)
    }

}


