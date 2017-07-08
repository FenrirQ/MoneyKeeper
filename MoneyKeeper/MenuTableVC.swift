//
//  MenuTableVC.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 7/1/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class MenuTableVC: UITableViewController {

    var delegate: MenuTableProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.passIndexFromCell(index: indexPath.row)
    }

}

protocol MenuTableProtocol {
    func passIndexFromCell(index: Int)
}
