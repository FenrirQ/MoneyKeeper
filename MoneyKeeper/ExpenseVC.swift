//
//  ExpenseVC.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 7/4/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class ExpenseVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let expenseDatasource = ExpenseDataSource()
    var expenseDelegate : ExpenseDelegate!
    let loanDataSource = LoanDataSource()
    var loanDelegate: LoanDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        expenseDelegate = ExpenseDelegate(expenseVC: self)
        loanDelegate = LoanDelegate(expenseVC: self)
        tableView.dataSource = expenseDatasource
        tableView.delegate = expenseDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    enum SegmentType: Int {
        case expense
        case loan
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case SegmentType.expense.rawValue:
            tableView.dataSource = expenseDatasource
            tableView.delegate = expenseDelegate
        case SegmentType.loan.rawValue:
            tableView.dataSource = loanDataSource
            tableView.delegate = loanDelegate
        default:
            return
        }
        tableView.reloadData()
    }
    

}
