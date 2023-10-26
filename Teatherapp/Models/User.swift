//
//  User.swift
//  GetInTouch
//
//  Created by AbdulWahabTanveer on 04/08/2023.
//

import Foundation

class UserModel:Identifiable,Codable{
    
    let id: Int
    var email : String?
    var phoneNumber : String? = ""
    var firstName : String? = ""
    var lastName : String? = ""
    var avatar : String? = ""
    
   
    init(id: Int, email: String? = nil, phoneNumber: String? = nil, firstName: String? = nil, lastName: String? = nil, avatar: String? = nil) {
        self.id = id
        self.email = email
        self.phoneNumber = phoneNumber
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
    }
}
