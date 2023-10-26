//
//  Room.swift
//  GetInTouch
//
//  Created by AbdulWahabTanveer on 11/08/2023.
//

import Foundation

class ChatRoom:Identifiable,Codable,ObservableObject{
    
    let id: Int
    var personOne : UserModel?
    var personTwo : UserModel?
    var messages:[MessageModel] = []
    
    init(id: Int, personOne: UserModel? = nil, personTwo: UserModel? = nil, messages: [MessageModel]) {
        self.id = id
        self.personOne = personOne
        self.personTwo = personTwo
        self.messages = messages
    }
   
}
