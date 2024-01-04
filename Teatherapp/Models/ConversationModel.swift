//
//  ConversationModel.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 02/11/2023.
//

// MARK: - ConversationModel
struct ConversationModel: Decodable {
    let status, message: String
    let data: [ConversationModelData]
}

// MARK: - ConversationModelData
struct ConversationModelData: Decodable {
    let chatID, senderID, receiverID, groupID: String
    let message, createdAt, conversationID, name: String
    let conType, messageCount: String
    let icon: String
    let isAdmin, isRead: String

    enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case senderID = "sender_id"
        case receiverID = "receiver_id"
        case groupID = "group_id"
        case message
        case createdAt = "created_at"
        case conversationID = "conversation_id"
        case name
        case conType = "con_type"
        case messageCount = "message_count"
        case icon
        case isAdmin = "is_admin"
        case isRead = "is_read"
    }
}
