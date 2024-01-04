//
//  LoginModel.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 20/10/2023.
//

import Foundation

struct LoginModel: Decodable {
    let status, message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable {
    let userID, roleID, username, name: String
    let email, securityPin, isNotification, homeAddress: String
    let homeLatitude, homeLongitude, address, latitude: String
    let longitude, createdDate, phoneCode, phoneNumber: String
    let photo, timeZone, locationUpdateTime, tag: String
    let city, state, zip, zelloUsername: String
    let temporaryAccessCode: String
    let circle: Circle

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case roleID = "role_id"
        case username, name, email
        case securityPin = "security_pin"
        case isNotification = "is_notification"
        case homeAddress = "home_address"
        case homeLatitude = "home_latitude"
        case homeLongitude = "home_longitude"
        case address, latitude, longitude
        case createdDate = "created_date"
        case phoneCode = "phone_code"
        case phoneNumber = "phone_number"
        case photo
        case timeZone = "time_zone"
        case locationUpdateTime = "location_update_time"
        case tag, city, state, zip
        case zelloUsername = "zello_username"
        case temporaryAccessCode = "temporary_access_code"
        case circle
    }
}

// MARK: - Circle
struct Circle: Decodable {
    let id, userID, circleName, type: String
    let invitationCode, codeGeneratedDate, status, createdAt: String
    let updatedAt, name, userName, circleImage: String
    let locationSharingOn, isAvailable, lastAvailableTime, accessType: String
    let userRole: String

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
        case isAvailable = "is_available"
        case lastAvailableTime = "last_available_time"
        case accessType = "access_type"
        case userRole = "user_role"
    }
}
