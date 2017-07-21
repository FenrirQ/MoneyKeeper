//
//  TutorialVC.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 7/14/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class TutorialVC: UIViewController {
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    
    
    var currentPage : Int = 0 {
        didSet {
            pageControl.currentPage = currentPage
            switch currentPage {
            case 0:
                leftButton.isSelected = true
            case pageControl.numberOfPages - 1:
                rightButton.isSelected = true
            default:
                leftButton.isSelected = false
                rightButton.isSelected = false
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.delegate = self
        leftButton.isSelected = true

    }
    
    override func viewDidAppear(_ animated: Bool) {
        pageControl.numberOfPages = Int(scroll.contentSize.width / scroll.bounds.size.width)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func next(_ sender: UIButton) {
        if sender.isSelected {
            //TODO: Signup
            performSegue(withIdentifier: "goToSignup", sender: sender)
        } else {
            scrollNext()
        }
    }
    
    @IBAction func previous(_ sender: UIButton) {
        if sender.isSelected {
            //TODO: Login
            performSegue(withIdentifier: "goToLogin", sender: sender)
        } else {
            scrollPrevious()
        }
    }
    
    func scrollNext() {
        let toX = scroll.contentOffset.x + scroll.bounds.size.width
        scroll.scrollRectToVisible(CGRect(x: toX, y: 0, width: scroll.bounds.size.width, height: scroll.bounds.size.height), animated: true)
    }
    
    func scrollPrevious() {
        let toX = scroll.contentOffset.x - scroll.bounds.size.width
        scroll.scrollRectToVisible(CGRect(x: toX, y: 0, width: scroll.bounds.size.width, height: scroll.bounds.size.height), animated: true)
    }
    
}

extension TutorialVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPage = Int((scrollView.contentOffset.x + scrollView.bounds.size.width / 2) / scrollView.bounds.size.width)
          }
    
    
}
