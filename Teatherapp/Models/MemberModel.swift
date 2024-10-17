//
//  MemberModel.swift
//  Teatherapp
//
//  Created by Hammad Khan on 14/10/2024.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let member = try? JSONDecoder().decode(Member.self, from: jsonData)

import Foundation

// MARK: - Member
struct MemberModel: Codable {
    let id, circleID, userID, role: String
    let accessType, locationSharingOn, isAvailable, lastAvailableTime: String
    let autoUnavailableStatus, isDefault, sequence, isNotification: String
    let status, createdAt, updatedAt, name: String
    let userName, username, photo, phoneCode: String
    let phoneNumber, zelloUsername, userEmail, userImage: String
    let userLatitude, userLongitude, userAddress, latitude: String
    let longitude, address, city, state: String
    let tag, locationUpdateTime, battery, wifi: String
    let mobileData, deviceID: String

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
    }
}


let dummyMembers: [MemberModel] = [
    MemberModel(
        id: "1",
        circleID: "circle_1",
        userID: "user_1",
        role: "admin",
        accessType: "full",
        locationSharingOn: "true",
        isAvailable: "true",
        lastAvailableTime: "2024-10-14T12:00:00Z",
        autoUnavailableStatus: "false",
        isDefault: "true",
        sequence: "1",
        isNotification: "true",
        status: "active",
        createdAt: "2024-01-01T10:00:00Z",
        updatedAt: "2024-10-14T10:00:00Z",
        name: "John Doe",
        userName: "johnny",
        username: "johnny123",
        photo: "http://example.com/photo1.jpg",
        phoneCode: "+1",
        phoneNumber: "1234567890",
        zelloUsername: "johnnyz",
        userEmail: "john.doe@example.com",
        userImage: "http://example.com/image1.jpg",
        userLatitude: "34.0522",
        userLongitude: "-118.2437",
        userAddress: "123 Main St",
        latitude: "34.0522",
        longitude: "-118.2437",
        address: "123 Main St",
        city: "Los Angeles",
        state: "CA",
        tag: "friend",
        locationUpdateTime: "2024-10-14T12:00:00Z",
        battery: "85",
        wifi: "connected",
        mobileData: "enabled",
        deviceID: "device_1"
    ),
    MemberModel(
        id: "2",
        circleID: "circle_1",
        userID: "user_2",
        role: "member",
        accessType: "limited",
        locationSharingOn: "false",
        isAvailable: "false",
        lastAvailableTime: "2024-10-12T15:00:00Z",
        autoUnavailableStatus: "true",
        isDefault: "false",
        sequence: "2",
        isNotification: "false",
        status: "inactive",
        createdAt: "2024-01-02T11:00:00Z",
        updatedAt: "2024-10-13T11:00:00Z",
        name: "Jane Smith",
        userName: "janes",
        username: "janesmith",
        photo: "http://example.com/photo2.jpg",
        phoneCode: "+1",
        phoneNumber: "0987654321",
        zelloUsername: "janesmithz",
        userEmail: "jane.smith@example.com",
        userImage: "http://example.com/image2.jpg",
        userLatitude: "40.7128",
        userLongitude: "-74.0060",
        userAddress: "456 Elm St",
        latitude: "40.7128",
        longitude: "-74.0060",
        address: "456 Elm St",
        city: "New York",
        state: "NY",
        tag: "coworker",
        locationUpdateTime: "2024-10-12T15:00:00Z",
        battery: "60",
        wifi: "disconnected",
        mobileData: "disabled",
        deviceID: "device_2"
    )
]
