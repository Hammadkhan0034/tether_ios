
import Foundation


// MARK: - Datum
struct ConversationModel: Codable, Equatable {
    let chatID, senderID, receiverID, groupID: String
    let message, createdAt, conversationID, name: String
    let conType, messageCount: String
    let icon: String
    let isAdmin: String
    let isRead: String?
    let members: [ConversationGroupMemberModel]?

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
        case members
    }
}

// MARK: - Member
struct ConversationGroupMemberModel: Codable, Equatable {
    let userID, name, username, photo: String
    let isAdmin: String

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case name, username, photo
        case isAdmin = "is_admin"
    }
}



// Test data for ConversationGroupMemberModel
let groupMember1 = ConversationGroupMemberModel(
    userID: "101",
    name: "John Doe",
    username: "johndoe",
    photo: "https://example.com/photos/john.jpg",
    isAdmin: "1"
)

let groupMember2 = ConversationGroupMemberModel(
    userID: "102",
    name: "Jane Smith",
    username: "janesmith",
    photo: "https://example.com/photos/jane.jpg",
    isAdmin: "0"
)

// Test data for ConversationModel
let conversationTestData = ConversationModel(
    chatID: "2001",
    senderID: "101",
    receiverID: "102",
    groupID: "3001",
    message: "Hello, how are you?",
    createdAt: "2024-12-31T10:00:00Z",
    conversationID: "5001",
    name: "Group Chat",
    conType: "group",
    messageCount: "42",
    icon: "https://example.com/icons/group_chat.png",
    isAdmin: "1",
    isRead: "0",
    members: [groupMember1, groupMember2]
)

