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

// MARK: - DataClass
struct ULDataClass: Decodable {
    let circles: [ULCircle]
    let circleSettings: ULCircleSettings
    let scheduledJobRequests: [String]
    let recentJobRequests: [ULRecentJobRequest]
    let ongoingJobRequests: [String]
    let favouriteLocations: [ULFavouriteLocation]

    enum CodingKeys: String, CodingKey {
        case circles
        case circleSettings = "circle_settings"
        case scheduledJobRequests = "scheduled_job_requests"
        case recentJobRequests = "recent_job_requests"
        case ongoingJobRequests = "ongoing_job_requests"
        case favouriteLocations = "favourite_locations"
    }
}

// MARK: - CircleSettings
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

// MARK: - Circle
struct ULCircle: Decodable {
    let id, userID, circleName: String
    let type: ULTypeEnum
    let invitationCode: ULInvitationCode
    let codeGeneratedDate: ULCodeGeneratedDate
    let status, createdAt, updatedAt, name: String
    let userName, circleImage, locationSharingOn, autoUnavailableStatus: String
    let isAvailable, lastAvailableTime, isNotification: String
    let accessType: ULAccessType
    let userRole: ULRole
    let isClockedIn, totalEasterEggs, totalMembers, totalLocations: String
    let members: [ULMember]
    let locations: [ULLocation]
    let subscriptionPackage: ULSubscriptionPackage?

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

enum ULAccessType: String, Decodable {
    case childAccess = "child_access"
    case fullAccess = "full_access"
    case limitedAccess = "limited_access"
}

enum ULCodeGeneratedDate: String, Decodable {
    case empty = ""
    case the20221104125724 = "2022-11-04 12:57:24"
}

enum ULInvitationCode: String, Decodable {
    case empty = ""
    case the5Qzcc3 = "5QZCC3"
}

// MARK: - Location
struct ULLocation: Decodable {
    let id, userID, circleID, title: String
    let location, latitude, longitude, radius: String
    let timeSheetGpsOn, isNotification, status, createdAt: String
    let updatedAt, createdBy: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case circleID = "circle_id"
        case title, location, latitude, longitude, radius
        case timeSheetGpsOn = "time_sheet_gps_on"
        case isNotification = "is_notification"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case createdBy = "created_by"
    }
}

// MARK: - Member
struct ULMember: Decodable {
    let id, circleID, userID: String
    let role: ULRole
    let accessType: ULAccessType
    let locationSharingOn, isAvailable, lastAvailableTime, autoUnavailableStatus: String
    let isDefault, sequence, isNotification, status: String
    let createdAt, updatedAt, name, userName: String
    let username, photo, phoneCode, phoneNumber: String
    let zelloUsername, userEmail, userImage, userLatitude: String
    let userLongitude, userAddress, latitude, longitude: String
    let address: String
    let city: ULCity
    let state: ULState
    let tag, locationUpdateTime, battery, wifi: String
    let mobileData, deviceID: String
    let noOfLocationHistory: String?
    let workingRequests: [ULWorkingRequest]?
    let breadcrumbIntervalTime, breadcrumbIntervalDistance: String?

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
        case noOfLocationHistory = "no_of_location_history"
        case workingRequests = "working_requests"
        case breadcrumbIntervalTime = "breadcrumb_interval_time"
        case breadcrumbIntervalDistance = "breadcrumb_interval_distance"
    }
}

enum ULCity: String, Decodable {
    case ahmedabad = "Ahmedabad"
    case cityAhmedabad = "Ahmedabad "
    case empty = ""
    case ladheWalaWaraich = "Ladhe Wala Waraich"
}

enum ULRole: String, Decodable {
    case admin = "admin"
    case member = "member"
}

enum ULState: String, Decodable {
    case empty = ""
    case gujarat = "Gujarat"
    case ladheWalaWaraich = "Ladhe Wala Waraich"
    case stateGujarat = "Gujarat "
}

// MARK: - WorkingRequest
struct ULWorkingRequest: Decodable {
    let userRequestID, userID, userAssignedID, location: String
    let locationLatitude, locationLongitude: String

    enum CodingKeys: String, CodingKey {
        case userRequestID = "user_request_id"
        case userID = "user_id"
        case userAssignedID = "user_assigned_id"
        case location
        case locationLatitude = "location_latitude"
        case locationLongitude = "location_longitude"
    }
}

// MARK: - SubscriptionPackage
struct ULSubscriptionPackage: Decodable {
    let id, circleID, userID, subscriptionID: String?
    let packageID, packageName, noOfEmployees, noOfLocationHistory: String?
    let noOfGeoFences, noOfJobs, noOfDispatchHistory, noOfFavLocations: String?
    let noOfEasterEggs, breadcrumbIntervalTime, breadcrumbIntervalDistance, createdOn: String?
    let updatedOn, packagePriceID, gpsPackageServiceType, gpsSubscriptionID: String?
    let isPurchasedByAdmin: String?

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
        case isPurchasedByAdmin = "is_purchased_by_admin"
    }
}

enum ULTypeEnum: String, Decodable {
    case basic = "basic"
    case business = "business"
}

// MARK: - FavouriteLocation
struct ULFavouriteLocation: Decodable {
    let id, userID, circleID, title: String
    let address, latitude, longitude, note: String
    let shareWith, createdAt, updatedAt, createdBy: String
    let totalAttachments: String
    let attachments: [ULAttachment]
    let shareWithList: [ULShareWithList]

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
struct ULAttachment: Decodable {
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
struct ULShareWithList: Decodable {
    let userID, roleID, name, username: String
    let email, photo: String

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case roleID = "role_id"
        case name, username, email, photo
    }
}

// MARK: - RecentJobRequest
struct ULRecentJobRequest: Decodable {
    let userRequestID, userID, userFromName, circleID: String
    let title, type, jobTaskType, amountReceived: String
    let powerNumber, comments, clientName, firstName: String
    let lastName, clientDob, clientBldgApt, clientPhoneNumber: String
    let locationLatitude, locationLongitude, needAdditionalNotes, isCallAgency: String
    let numberIndemnitors, needPaperWork, needClientSignature, needClientPaymentPlan: String
    let isAutoArrive, isAutoComplete, paymentAlreadyReceived, amountToCollect: String
    let paymentPlan, instructionForEmployee, userAssignedID, userAssignedName: String
    let userAssignedPhoto, location, createdAt, requestAcceptedTime: String
    let requestArrivedTime, requestAbortedTime, requestCompletionTime, sentRequestTime: String
    let isAccept, isJobStart, requestJobStartTime, isEditPending: String
    let isComplete, isAborted, isCancel, isRead: String
    let clientID, invoiceNumber, signaturePhoto, cosignerPhoto: String
    let clientPhoto, isSchedule, requestScheduleTime, selfAssigned: String
    let isEvent, isAutoStart, requestScheduleEndTime, isRecurring: String
    let recurringDays, recurringTime, recurringEnd, intervalType: String
    let intervalTime, circleUserID, circleName, circlePhoto: String
    let senderPhoneCode, senderPhoneNumber, senderName, reminders: String
    let requestAttachments, descriptionList, indemnitorsList, subTask: [String]
    let checkinHistories: [String]

    enum CodingKeys: String, CodingKey {
        case userRequestID = "user_request_id"
        case userID = "user_id"
        case userFromName = "user_from_name"
        case circleID = "circle_id"
        case title, type
        case jobTaskType = "job_task_type"
        case amountReceived = "amount_received"
        case powerNumber = "power_number"
        case comments
        case clientName = "client_name"
        case firstName = "first_name"
        case lastName = "last_name"
        case clientDob = "client_dob"
        case clientBldgApt = "client_bldg_apt"
        case clientPhoneNumber = "client_phone_number"
        case locationLatitude = "location_latitude"
        case locationLongitude = "location_longitude"
        case needAdditionalNotes = "need_additional_notes"
        case isCallAgency = "is_call_agency"
        case numberIndemnitors = "number_indemnitors"
        case needPaperWork = "need_paper_work"
        case needClientSignature = "need_client_signature"
        case needClientPaymentPlan = "need_client_payment_plan"
        case isAutoArrive = "is_auto_arrive"
        case isAutoComplete = "is_auto_complete"
        case paymentAlreadyReceived = "payment_already_received"
        case amountToCollect = "amount_to_collect"
        case paymentPlan = "payment_plan"
        case instructionForEmployee = "instruction_for_employee"
        case userAssignedID = "user_assigned_id"
        case userAssignedName = "user_assigned_name"
        case userAssignedPhoto = "user_assigned_photo"
        case location
        case createdAt = "created_at"
        case requestAcceptedTime = "request_accepted_time"
        case requestArrivedTime = "request_arrived_time"
        case requestAbortedTime = "request_aborted_time"
        case requestCompletionTime = "request_completion_time"
        case sentRequestTime = "sent_request_time"
        case isAccept = "is_accept"
        case isJobStart = "is_job_start"
        case requestJobStartTime = "request_job_start_time"
        case isEditPending = "is_edit_pending"
        case isComplete = "is_complete"
        case isAborted = "is_aborted"
        case isCancel = "is_cancel"
        case isRead = "is_read"
        case clientID = "client_id"
        case invoiceNumber = "invoice_number"
        case signaturePhoto = "signature_photo"
        case cosignerPhoto = "cosigner_photo"
        case clientPhoto = "client_photo"
        case isSchedule = "is_schedule"
        case requestScheduleTime = "request_schedule_time"
        case selfAssigned = "self_assigned"
        case isEvent = "is_event"
        case isAutoStart = "is_auto_start"
        case requestScheduleEndTime = "request_schedule_end_time"
        case isRecurring = "is_recurring"
        case recurringDays = "recurring_days"
        case recurringTime = "recurring_time"
        case recurringEnd = "recurring_end"
        case intervalType = "interval_type"
        case intervalTime = "interval_time"
        case circleUserID = "circle_user_id"
        case circleName = "circle_name"
        case circlePhoto = "circle_photo"
        case senderPhoneCode = "sender_phone_code"
        case senderPhoneNumber = "sender_phone_number"
        case senderName = "sender_name"
        case reminders
        case requestAttachments = "request_attachments"
        case descriptionList = "description_list"
        case indemnitorsList = "indemnitors_list"
        case subTask = "sub_task"
        case checkinHistories = "checkin_histories"
    }
}
