//
//  User.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/15/25.
//

import Foundation

//Planning to use this type to pass in logic for other UIs like current registrations

class User: ObservableObject {
    let userID: String
    var userPIN: String
    var birthdate: Date?
    var password: String?
   //add additional details here
    
    
    
    init(userID: String, userPassword: String) {
        self.userID = userID
        self.userPIN = userPassword
    }
}

