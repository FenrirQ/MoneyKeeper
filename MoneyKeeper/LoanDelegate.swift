//
//  LoanDataDelegate.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 7/6/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class LoanDelegate: NSObject, UITableViewDelegate {
    
    unowned var expenseVC: ExpenseVC
    
    init(expenseVC:ExpenseVC) {
        self.expenseVC = expenseVC
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let name = cell?.textLabel?.text
        let image = cell?.imageView?.image
        NotificationCenter.default.post(name: NotificationKey.postNotiFromCell, object: nil, userInfo: [name!: image!])
        expenseVC.navigationController?.popViewController(animated: true)
    }
}
