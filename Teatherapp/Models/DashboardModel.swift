
import Foundation

struct DashboardModel: Codable {
    let circles: [CircleModel]
    let circleSettings: CircleSettings
    let favouriteLocations: [FavoriteLocationModel]

    enum CodingKeys: String, CodingKey {
        case circles
        case circleSettings = "circle_settings"
        case favouriteLocations = "favourite_locations"
    }
}

struct CircleSettings: Codable {
    let isNotification: String

    enum CodingKeys: String, CodingKey {
        case isNotification = "is_notification"
    }
}

struct CircleModel: Identifiable, Codable  {
    let id, userID, circleName, type: String
    let invitationCode, codeGeneratedDate, status, createdAt: String
    let updatedAt, name, userName, circleImage: String
    let locationSharingOn, autoUnavailableStatus, isAvailable, lastAvailableTime: String
    let isNotification, accessType, userRole, isClockedIn: String
    let totalEasterEggs, totalMembers, totalLocations: String
    let members: [MemberDashboardModel]
    let subscriptionPackage: SubscriptionPackage

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case circleName = "circle_name"
        case type
        case invitationCode = "invitation_code"
        case codeGeneratedDate = "code_generated_date"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case name
        case userName = "user_name"
        case circleImage = "circle_image"
        case locationSharingOn = "location_sharing_on"
        case autoUnavailableStatus = "auto_unavailable_status"
        case isAvailable = "is_available"
        case lastAvailableTime = "last_available_time"
        case isNotification = "is_notification"
        case accessType = "access_type"
        case userRole = "user_role"
        case isClockedIn = "is_clocked_in"
        case totalEasterEggs = "total_easter_eggs"
        case totalMembers = "total_members"
        case totalLocations = "total_locations"
        case members
        case subscriptionPackage = "subscription_package"
    }
}

struct MemberDashboardModel: Codable , Identifiable{
    let id, circleID, userID, role: String
    let accessType, locationSharingOn, isAvailable, lastAvailableTime: String
    let autoUnavailableStatus, isDefault, sequence, isNotification: String
    let status, createdAt, updatedAt, name: String
    let userName, username, photo, phoneCode: String
    let phoneNumber, zelloUsername, userEmail, userImage: String
    let userLatitude, userLongitude, userAddress, latitude: String
    let longitude, address, city, state: String
    let tag, locationUpdateTime, battery, wifi: String
    let mobileData, deviceID, breadcrumbIntervalTime, breadcrumbIntervalDistance: String
    let noOfLocationHistory: String

    enum CodingKeys: String, CodingKey {
        case id
        case circleID = "circle_id"
        case userID = "user_id"
        case role
        case accessType = "access_type"
        case locationSharingOn = "location_sharing_on"
        case isAvailable = "is_available"
        case lastAvailableTime = "last_available_time"
        case autoUnavailableStatus = "auto_unavailable_status"
        case isDefault = "is_default"
        case sequence
        case isNotification = "is_notification"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case name
        case userName = "user_name"
        case username, photo
        case phoneCode = "phone_code"
        case phoneNumber = "phone_number"
        case zelloUsername = "zello_username"
        case userEmail = "user_email"
        case userImage = "user_image"
        case userLatitude = "user_latitude"
        case userLongitude = "user_longitude"
        case userAddress = "user_address"
        case latitude, longitude, address, city, state, tag
        case locationUpdateTime = "location_update_time"
        case battery, wifi
        case mobileData = "mobile_data"
        case deviceID = "device_id"
        case breadcrumbIntervalTime = "breadcrumb_interval_time"
        case breadcrumbIntervalDistance = "breadcrumb_interval_distance"
        case noOfLocationHistory = "no_of_location_history"
    }
}

struct SubscriptionPackage: Codable {
    let id, circleID, userID, subscriptionID: String
    let packageID, packageName, noOfEmployees, noOfLocationHistory: String
    let noOfGeoFences, noOfJobs, noOfDispatchHistory, noOfFavLocations: String
    let noOfEasterEggs, breadcrumbIntervalTime, breadcrumbIntervalDistance, createdOn: String
    let updatedOn, packagePriceID: String

    enum CodingKeys: String, CodingKey {
        case id
        case circleID = "circle_id"
        case userID = "user_id"
        case subscriptionID = "subscription_id"
        case packageID = "package_id"
        case packageName = "package_name"
        case noOfEmployees = "no_of_employees"
        case noOfLocationHistory = "no_of_location_history"
        case noOfGeoFences = "no_of_geo_fences"
        case noOfJobs = "no_of_jobs"
        case noOfDispatchHistory = "no_of_dispatch_history"
        case noOfFavLocations = "no_of_fav_locations"
        case noOfEasterEggs = "no_of_easter_eggs"
        case breadcrumbIntervalTime = "breadcrumb_interval_time"
        case breadcrumbIntervalDistance = "breadcrumb_interval_distance"
        case createdOn = "created_on"
        case updatedOn = "updated_on"
        case packagePriceID = "package_price_id"
    }
}

// MARK: - FavouriteLocation
struct FavoriteLocationModel: Identifiable, Codable {
    let id, userID, circleID, title: String
    let address, latitude, longitude, note: String
    let shareWith, createdAt, updatedAt, createdBy: String
    let totalAttachments: String
    let attachments: [Attachment]
    let shareWithList: ShareWithListType

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case circleID = "circle_id"
        case title, address, latitude, longitude, note
        case shareWith = "share_with"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case createdBy = "created_by"
        case totalAttachments = "total_attachments"
        case attachments
        case shareWithList = "share_with_list"
    }
}

// MARK: - Attachment
struct Attachment: Identifiable, Codable  {
    let id, favouriteLocationID, name: String
    let path: String
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case favouriteLocationID = "favourite_location_id"
        case name, path
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - ShareWithList
struct ShareWithMemberListModel: Codable {
    let userID, roleID, name, username: String
    let email, photo: String

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case roleID = "role_id"
        case name, username, email, photo
    }
}
// MARK: - ShareWithTeamListModel
struct ShareWithTeamListModel: Codable {
    let circleID, circleName, photo: String

    enum CodingKeys: String, CodingKey {
        case circleID = "circle_id"
        case circleName = "circle_name"
        case photo
    }
}



// Define an enum to represent the two types in shareWithList
enum ShareWithListType: Codable {
    case team([ShareWithTeamListModel])
    case member([ShareWithMemberListModel])

    // Custom decoding based on the JSON structure
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        // Try decoding as [ShareWithTeamListModel]
        if let teamList = try? container.decode([ShareWithTeamListModel].self) {
            self = .team(teamList)
            return
        }

        // Try decoding as [ShareWithMemberListModel]
        if let memberList = try? container.decode([ShareWithMemberListModel].self) {
            self = .member(memberList)
            return
        }

        // Throw an error if neither type could be decoded
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unable to decode as ShareWithTeamListModel or ShareWithMemberListModel")
    }
    
    func getListLength() -> Int{
        // Access team data if it is a team case
        if case .team(let teamList) = self {
            return teamList.count
        }

        // Access member data if it is a member case
        if case .member(let memberList) = self {
            return memberList.count
        }
        return 1
    }
    
    func getListType() -> String{
        // Access team data if it is a team case
        if case .team(let teamList) = self {
            return "Teams"
        }

        // Access member data if it is a member case
        if case .member(let memberList) = self {
            return "Members"
        }
        return "Teams"
    }
    
    // Custom encoding based on the enum case
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .team(let teamList):
            try container.encode(teamList)
        case .member(let memberList):
            try container.encode(memberList)
        }
    }
}


let testCircles = [
    CircleModel.sampleData(),
    CircleModel.sampleData(),
    CircleModel.sampleData(),
    CircleModel.sampleData(),
    CircleModel.sampleData(),
    CircleModel.sampleData(),
    CircleModel.sampleData(),
    CircleModel.sampleData(),
    CircleModel.sampleData()
]



extension CircleModel {
    static func sampleData() -> CircleModel {
        return CircleModel(
            id: "1",
            userID: "1001",
            circleName: "Family Circle",
            type: "Family",
            invitationCode: "INV2024",
            codeGeneratedDate: "2024-10-29T12:00:00Z",
            status: "active",
            createdAt: "2024-01-01T08:00:00Z",
            updatedAt: "2024-10-01T08:00:00Z",
            name: "Home",
            userName: "JaneDoe",
            circleImage: "https://example.com/circle_image.png",
            locationSharingOn: "true",
            autoUnavailableStatus: "false",
            isAvailable: "true",
            lastAvailableTime: "2024-10-28T18:00:00Z",
            isNotification: "true",
            accessType: "private",
            userRole: "admin",
            isClockedIn: "true",
            totalEasterEggs: "3",
            totalMembers: "5",
            totalLocations: "2",
            members: [
                MemberDashboardModel.sampleData1(),
                MemberDashboardModel.sampleData2()
            ],
            subscriptionPackage: SubscriptionPackage.sampleData3()
        )
    }
}





