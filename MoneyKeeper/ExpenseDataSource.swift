//
//  ExpenseDataSource.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 7/5/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class ExpenseDataSource: NSObject, UITableViewDataSource {

    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return ExpenseModel.shared.expenseKey.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ExpenseModel.shared.getKeysFromExpenseKeyAt(index: section).count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let imageArr = ExpenseModel.shared.getImageFromExpenseKeyAt(index: indexPath.section)
        let keyArr = ExpenseModel.shared.getKeysFromExpenseKeyAt(index: indexPath.section)

        cell.imageView?.image = imageArr[indexPath.row]
        cell.imageView?.contentMode = .scaleAspectFit
        cell.textLabel?.text = keyArr[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ExpenseModel.shared.expenseKey[section]
    }

    

}
