//
//  UserDetailsModel.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 10/11/2023.
//

import Foundation

// MARK: - UserDetailsModel
struct UserDetailsModel: Decodable {
    let status, message: String?
    let userDetails: UserDetails?

    enum CodingKeys: String, CodingKey {
        case status, message
        case userDetails = "user_details"
    }
}

// MARK: - UserDetails
struct UserDetails: Decodable {
    let userID, roleID, name, username: String?
    let email, password, securityPin, phoneCode: String?
    let phoneNumber, photo, address, latitude: String?
    let longitude, homeAddress, homeLatitude, homeLongitude: String?
    let deviceID, deviceType, temporaryAccessCode, timeZone: String?
    let zelloUsername, isNotification, locationUpdateTime, tag: String?
    let state, city, zip, stripeCustomerID: String?
    let status, userName, userEmail, userImage: String?
    let battery, wifi, mobileData, hourlyRate: String?

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case roleID = "role_id"
        case name, username, email, password
        case securityPin = "security_pin"
        case phoneCode = "phone_code"
        case phoneNumber = "phone_number"
        case photo, address, latitude, longitude
        case homeAddress = "home_address"
        case homeLatitude = "home_latitude"
        case homeLongitude = "home_longitude"
        case deviceID = "device_id"
        case deviceType = "device_type"
        case temporaryAccessCode = "temporary_access_code"
        case timeZone = "time_zone"
        case zelloUsername = "zello_username"
        case isNotification = "is_notification"
        case locationUpdateTime = "location_update_time"
        case tag, state, city, zip
        case stripeCustomerID = "stripe_customer_id"
        case status
        case userName = "user_name"
        case userEmail = "user_email"
        case userImage = "user_image"
        case battery, wifi
        case mobileData = "mobile_data"
        case hourlyRate = "hourly_rate"
    }
}
