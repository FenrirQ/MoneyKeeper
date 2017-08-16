//
//  Parser.swift
//  MoneyKeeper
//
//  Created by Quang Ly Hoang on 8/11/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import Foundation
import Alamofire

class Parser {
    
    func parseJSON(json: Any) -> MyUsers? {
        var myUsers: MyUsers?
        guard let json = json as? [Dictionary<String, Any>] else {return nil}
        for dict in json {
            guard let id = dict["id"] as? String else {return nil}
            guard let email = dict["email"] as? String else {return nil}
            guard let password = dict["password"] as? String else {return nil}
            
            let user = User(id: id, email: email, password: password)
            
            if let _ = myUsers {
                myUsers?.users.append(user)
            } else {
                myUsers = MyUsers(users: [user])
            }
        }
        return myUsers
    }
    
    func parseParameter(email: String, password: String) -> Parameters {
        let parameter: Parameters = ["email" : email, "password" : password]
        return parameter
    }
}
