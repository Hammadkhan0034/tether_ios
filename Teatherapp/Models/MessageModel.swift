//
//  MessageModel.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 11/11/2023.
//

import Foundation

// MARK: - MessageModel
struct MessageModel: Decodable {
    let status, message: String
    let data: MessageDataClass
}

// MARK: - MessageDataClass
struct MessageDataClass: Decodable {
    let id, circleID, senderID, receiverID: String
    let conversationID, groupID, message, location: String
    let createdAt, updatedAt, senderName, receiverName: String
    let senderPhoto, isRead, isDelivered: String

    enum CodingKeys: String, CodingKey {
        case id
        case circleID = "circle_id"
        case senderID = "sender_id"
        case receiverID = "receiver_id"
        case conversationID = "conversation_id"
        case groupID = "group_id"
        case message, location
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case senderName = "sender_name"
        case receiverName = "receiver_name"
        case senderPhoto = "sender_photo"
        case isRead = "is_read"
        case isDelivered = "is_delivered"
    }
}
