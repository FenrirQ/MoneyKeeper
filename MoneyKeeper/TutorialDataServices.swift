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
    
    private init() {}
    
    private var myUsers: MyUsers?
    
    private let url = "http://localhost:2403/my-objects"
    
    private var status: Int? {
        didSet {
            NotificationCenter.default.post(name: NotificationKey.loginTapped, object: nil, userInfo: ["status" : status!])
        }
    }
    
    //MARK: Login and Signup
    func login(email: String, password: String) {
        getAPI(url: url) { (json) in
            self.myUsers = Parser().parseJSON(json: json)
            if let myUsers = self.myUsers {
                for user in myUsers.users {
                    if user.email == email && user.password == password {
                        self.status = 0
                        return
                    }
                }
                self.status = 1
                return
            } else {
                self.status = 1
                return
            }
        }
    }
    
    func signup(email: String, password: String) {
        let isValidEmail = checkEmail(email: email)
        
        if !isValidEmail || password.characters.count < 6 {
            status = 1
            return
        }
        getAPI(url: url) { (json) in
            self.myUsers = Parser().parseJSON(json: json)
            if let myUsers = self.myUsers {
                for user in myUsers.users {
                    if user.email == email {
                        self.status = 2
                        return
                    }
                }
            }
            let parameter = Parser().parseParameter(email: email, password: password)
            self.postAPI(url: self.url, parameter: parameter)
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
    
    func postAPI(url: String, parameter: Parameters) {
        Alamofire.request(url, method: .post, parameters: parameter).responseJSON { (response) in
            if response.result.isFailure {
                self.status = 1
            } else {
                self.status = 0
            }
        }
    }
    
    //MARK: Validate a email
    private func checkEmail(email : String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
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
    case isSuccess = 0
    case isFailure = 1
    case isExisted = 2
}



