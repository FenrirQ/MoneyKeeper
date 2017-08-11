//
//  TutorialDataServices.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 8/11/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import Foundation
import Alamofire

class TutorialDataServices {
    
    static var shared: TutorialDataServices = TutorialDataServices()
    
    private var myUsers: MyUsers?
    
    private let url = "http://localhost:2403/my-objects"
    var status: Int?
    
    //MARK: Login and Signup
    func login(email: String, password: String) {
        getAPI(url: url) { (json) in
            self.myUsers = Parser().parseJSON(json: json)
            if let myUsers = self.myUsers {
                for user in myUsers.users {
                    if user.email == email && user.password == password {
                        self.status = 0
                        return
                    } else if user.email == email && user.password != password {
                        self.status = 2
                        return
                    }
                }
                self.status = 3
                return
            } else {
                self.status = 3
                return
            }
        }
    }
    
    //MARK: Request API
    func getAPI(url: String, completion: @escaping (Any) -> ()) {
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isFailure {
                self.status = 1
            } else {
                guard let json = response.result.value else {return}
                completion(json)
            }
        }
    }
    
    
}

struct MyUsers {
    var users: [User]
}

struct User {
    var id : String
    var email: String
    var password: String
}

enum ServerStatus: Int {
    case isLoginSuccess = 0
    case isFailureError = 1
    case isPasswordWrong = 2
    case isNotSignup = 3
}
