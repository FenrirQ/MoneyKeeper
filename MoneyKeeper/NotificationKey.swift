//
//  NotificationKey.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 7/7/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import Foundation

struct NotificationKey {
    static let textFieldClick = NSNotification.Name.init("textFieldClick")
    static let calculatorTap = NSNotification.Name.init("calculatorTap")
    static let setTitleMenuButton = NSNotification.Name.init("setTitleMenuButton")
    static let postNotiFromCell = NSNotification.Name.init("postNotiFromCell")
    static let loginTapped = NSNotification.Name.init("loginTapped")
}
