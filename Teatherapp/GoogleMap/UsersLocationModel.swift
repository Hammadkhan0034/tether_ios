//
//  UsersLocationModel.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 13/12/2023.
//

import Foundation

// MARK: - UsersLocationModel
struct UsersLocationModel: Decodable {
    let status, message: String
    let data: ULDataClass
}

// MARK: - ULDataClass
struct ULDataClass: Decodable {
    let circles: [Circle]
    let circleSettings: ULCircleSettings
    let scheduledJobRequests, recentJobRequests, ongoingJobRequests, favouriteLocations: [String]

    enum CodingKeys: String, CodingKey {
        case circles
        case circleSettings = "circle_settings"
        case scheduledJobRequests = "scheduled_job_requests"
        case recentJobRequests = "recent_job_requests"
        case ongoingJobRequests = "ongoing_job_requests"
        case favouriteLocations = "favourite_locations"
    }
}

// MARK: - ULCircleSettings
struct ULCircleSettings: Decodable {
    let stopJobTrackingOn, aggressivePopup, pictureRequiredForClockIn, pictureRequiredForClockOut: String
    let datetimeRequiredClockinoutPicture, datetimeRequiredCheckinPicture, datetimeRequiredAddNotePicture, isNotification: String

    enum CodingKeys: String, CodingKey {
        case stopJobTrackingOn = "stop_job_tracking_on"
        case aggressivePopup = "aggressive_popup"
        case pictureRequiredForClockIn = "picture_required_for_clock_in"
        case pictureRequiredForClockOut = "picture_required_for_clock_out"
        case datetimeRequiredClockinoutPicture = "datetime_required_clockinout_picture"
        case datetimeRequiredCheckinPicture = "datetime_required_checkin_picture"
        case datetimeRequiredAddNotePicture = "datetime_required_add_note_picture"
        case isNotification = "is_notification"
    }
}

// MARK: - ULCircle
struct ULCircle: Decodable {
    let id, userID, circleName, type: String
    let invitationCode, codeGeneratedDate, status, createdAt: String
    let updatedAt, name, userName, circleImage: String
    let locationSharingOn, autoUnavailableStatus, isAvailable, lastAvailableTime: String
    let isNotification, accessType, userRole, isClockedIn: String
    let totalEasterEggs, totalMembers, totalLocations: String
    let members: [ULMember]
    let locations: [String]
    let subscriptionPackage: ULSubscriptionPackage

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
        case members, locations
        case subscriptionPackage = "subscription_package"
    }
}

// MARK: - ULMember
struct ULMember: Decodable {
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

// MARK: - ULSubscriptionPackage
struct ULSubscriptionPackage: Decodable {
    let id, circleID, userID, subscriptionID: String
    let packageID, packageName, noOfEmployees, noOfLocationHistory: String
    let noOfGeoFences, noOfJobs, noOfDispatchHistory, noOfFavLocations: String
    let noOfEasterEggs, breadcrumbIntervalTime, breadcrumbIntervalDistance, createdOn: String
    let updatedOn, packagePriceID, gpsPackageServiceType, gpsSubscriptionID: String

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
        case gpsPackageServiceType = "gps_package_service_type"
        case gpsSubscriptionID = "gps_subscription_id"
    }
}
