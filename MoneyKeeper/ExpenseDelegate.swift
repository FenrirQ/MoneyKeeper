//
//  ExpenseDelegate.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 7/5/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class ExpenseDelegate: NSObject, UITableViewDelegate {
    
    unowned var expenseVC: ExpenseVC
    
    init(expenseVC:ExpenseVC) {
        self.expenseVC = expenseVC
    }

    
    var tags: [Int] = []
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //create view for section header
        let view = UIView(frame: CGRect(x: tableView.frame.width/5, y: 0, width: tableView.frame.width, height: 44))
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        
        //create label in section
        let label = UILabel(frame: view.frame)
        label.text = ExpenseModel.shared.expenseKey[section]
        label.isUserInteractionEnabled = true
        
        //create imageView in section
        let imageView = UIImageView(frame: CGRect(x: tableView.frame.width/12.5, y: 5, width: tableView.frame.width/12.5, height: 44/1.5))
        imageView.image = ExpenseModel.shared.sectionDict[label.text!]
        
        //add
        view.addSubview(label)
        view.addSubview(imageView)
        
        //add gesture for label
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        label.addGestureRecognizer(tap)
        label.tag = section
        
        return view
    }
    
    func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        let section = gesture.view!.tag
        guard let index = tags.index(of: section) else {
            tags.append(section)
            updateRows(section: section)
            return
        }
        tags.remove(at: index)
        updateRows(section: section)
    }
    
    func updateRows(section: Int) {
        expenseVC.tableView.beginUpdates()
        for i in 0 ..< ExpenseModel.shared.getKeysFromExpenseKeyAt(index: section).count {
            expenseVC.tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        expenseVC.tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tags.contains(indexPath.section) ? 0 : 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let name = cell?.textLabel?.text
        let image = cell?.imageView?.image
        NotificationCenter.default.post(name: NotificationKey.postNotiFromCell, object: nil, userInfo: [name!: image!])
        expenseVC.navigationController?.popViewController(animated: true)
    }
    
}

