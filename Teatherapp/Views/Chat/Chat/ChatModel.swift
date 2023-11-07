//
//  ChatModel.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 02/11/2023.
//

import Foundation

// MARK: - ChatModel
struct ChatModel: Decodable {
    let status, message, conversationID: String
    let data: [ChatModelData]

    enum CodingKeys: String, CodingKey {
        case status, message
        case conversationID = "conversation_id"
        case data
    }
}

// MARK: - ChatModelData
struct ChatModelData: Decodable {
    let id, circleID, senderID, receiverID: String
    let conversationID, groupID, message, location: String
    let createdAt, updatedAt, senderName, receiverName: String
    let isRead, isDelivered: String

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
        case isRead = "is_read"
        case isDelivered = "is_delivered"
    }
}
