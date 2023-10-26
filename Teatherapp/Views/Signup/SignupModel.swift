//
//  SignupModel.swift
//  Teatherapp
//
//  Created by Muhammad Qayyum on 20/10/2023.
//

import Foundation

struct SignupModel: Decodable {
    let status, message: String
    let data: SignupDataClass
}

// MARK: - DataClass
struct SignupDataClass: Decodable {
    let userID, roleID, username, name: String
    let email, securityPin, isNotification, homeAddress: String
    let homeLatitude, homeLongitude, address, latitude: String
    let longitude, createdDate, phoneCode, phoneNumber: String
    let photo, timeZone, locationUpdateTime, tag: String
    let city, state, zip, zelloUsername: String
    let temporaryAccessCode: String

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
    }
}
