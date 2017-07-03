//
//  ButtonBar.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 7/1/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

extension ContainerVC {
    
    func registerNotificationForPageView() {
        NotificationCenter.default.addObserver(self, selector: #selector(setTitleButtonName), name: NotificationKey.setTitleMenuButton, object: nil)
    }
    
    func setTitleButtonName(_ notification: Notification) {
        guard let dict = notification.userInfo else {return}
        let buttonName = String(describing: dict["rowName"] ?? "")
        menuButton.setTitle(buttonName, for: .normal)
    }
}
