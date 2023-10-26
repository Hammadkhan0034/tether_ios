//
//  Message.swift
//  GetInTouch
//
//  Created by AbdulWahabTanveer on 11/08/2023.
//

import Foundation

class MessageModel:Identifiable,Codable{
    
    let id: Int
    var sender : UserModel?
    var receiver : UserModel?
    var text : String?
    var timeStamp : Date?
   
    init(id: Int, sender: UserModel? = nil, receiver: UserModel? = nil, text: String? = nil, timeStamp: Date? = nil) {
        self.id = id
        self.sender = sender
        self.receiver = receiver
        self.text = text
        self.timeStamp = timeStamp
    }
}
