//
//  ExpenseModel.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 7/5/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class ExpenseModel {
    static let shared: ExpenseModel = ExpenseModel()
    
    private let expenseDict = [
        "Food and Dinning":
            ["Groceries": #imageLiteral(resourceName: "Furnishing"),
             "Restaurant": #imageLiteral(resourceName: "Restaurant"),
             "Bars & Coffee": #imageLiteral(resourceName: "Bar & Coffee")],
        "Utilities":
            ["Electricity": #imageLiteral(resourceName: "Electricity"),
             "Water": #imageLiteral(resourceName: "Water"),
             "Internet": #imageLiteral(resourceName: "Internet"),
             "Gas": #imageLiteral(resourceName: "Gas")],
        "Auto & Transport":
            ["Fuel": #imageLiteral(resourceName: "Fuel"),
             "Service & Parts": #imageLiteral(resourceName: "Service & Parts"),
             "Repair vehicles": #imageLiteral(resourceName: "Repair vehicles"),
             "Parking": #imageLiteral(resourceName: "Parking"),
             "Car wash": #imageLiteral(resourceName: "Car wash"),
             "Taxi": #imageLiteral(resourceName: "Taxi")
            ],
        "Kids":
            ["Tuition": #imageLiteral(resourceName: "Tuition"),
             "Books": #imageLiteral(resourceName: "Books"),
             "Baby Supplies": #imageLiteral(resourceName: "Baby Supplies"),
             "Toys": #imageLiteral(resourceName: "Toys"),
             "Allowance": #imageLiteral(resourceName: "Allowance")],
        "Clothing":
            ["Clothes": #imageLiteral(resourceName: "Clothes"),
             "Shoes": #imageLiteral(resourceName: "Shoes"),
             "Accessories": #imageLiteral(resourceName: "Accessories")],
        "Gifts & Donations":
            ["Marriages": #imageLiteral(resourceName: "Marriages"),
             "Funerals": #imageLiteral(resourceName: "Funerals"),
             "Charity": #imageLiteral(resourceName: "Charity"),
             "Gifts": #imageLiteral(resourceName: "Gifts")],
        "Entertainment":
            ["Music": #imageLiteral(resourceName: "Music"),
             "Travel": #imageLiteral(resourceName: "Travel"),
             "Make up": #imageLiteral(resourceName: "Make up"),
             "Movies & DVDs": #imageLiteral(resourceName: "Movies & DVDs"),
             "Cosmetic": #imageLiteral(resourceName: "Cosmetic")]
    ]
    private let loanDict = ["Lend": #imageLiteral(resourceName: "Lend"), "Repayment": #imageLiteral(resourceName: "Repayment")]
    
    private let expenseSection = [
        "Food and Dinning": #imageLiteral(resourceName: "Food and Dining"),
        "Utilities": #imageLiteral(resourceName: "Utilities"),
        "Auto & Transport": #imageLiteral(resourceName: "Auto & Transport"),
        "Kids": #imageLiteral(resourceName: "Kids"),
        "Clothing": #imageLiteral(resourceName: "Clothing"),
        "Gifts & Donations": #imageLiteral(resourceName: "Gifts & Donations"),
        "Entertainment": #imageLiteral(resourceName: "Entertainment")
    ]
    
    var expenseKey: [String] {
        return Array(expenseDict.keys)
    }
    
    var loanKey: [String] {
        return Array(loanDict.keys)
    }
    
    var loanImage: [UIImage] {
        return Array(loanDict.values)
    }
    
    var sectionDict: [String : UIImage] {
        return expenseSection
    }
    
    func getKeysFromExpenseKeyAt(index: Int) -> [String] {
        if index >= 0 && index < expenseKey.count {
            if let dict = expenseDict[expenseKey[index]] {
                return Array(dict.keys)
            }
        }
        return []
    }
    
    func getImageFromExpenseKeyAt(index: Int) -> [UIImage] {
        if index >= 0 && index < expenseKey.count {
            if let dict = expenseDict[expenseKey[index]] {
                return Array(dict.values)
            }
        }
        return []
    }
    
    
}
