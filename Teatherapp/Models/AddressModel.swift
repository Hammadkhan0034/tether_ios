//
//  AddressModel.swift
//  Teatherapp
//
//  Created by Hammad Khan on 21/10/2024.
//
import Foundation

struct LocationData: Codable {
    let location: LocationModel
}

struct LocationDataWithTotalCount: Codable {
    let locations: [LocationModel]
    let totalLocations: String

    enum CodingKeys: String, CodingKey {
        case locations
        case totalLocations = "total_locations"
    }
}


// Todo: Handle member implementation

struct LocationModel: Codable,Identifiable {
    let id, userID, circleID, title: String
    let location, latitude, longitude, radius: String
    let timeSheetGpsOn, isNotification, status, createdAt: String
    let updatedAt, createdBy: String
    let active: String?
    let members: [AddressMemberModel]

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
        case active, members
    }
    
    init(
        id: String,
        userID: String,
        circleID: String,
        title: String,
        location: String,
        latitude: String,
        longitude: String,
        radius: String,
        timeSheetGpsOn: String,
        isNotification: String,
        status: String,
        createdAt: String,
        updatedAt: String,
        createdBy: String,
        active: String?,
        members: [AddressMemberModel]
    ) {
        self.id = id
        self.userID = userID
        self.circleID = circleID
        self.title = title
        self.location = location
        self.latitude = latitude
        self.longitude = longitude
        self.radius = radius
        self.timeSheetGpsOn = timeSheetGpsOn
        self.isNotification = isNotification
        self.status = status
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.createdBy = createdBy
        self.active = active
        self.members = members
    }

    

    
    func copy(
            id: String? = nil,
            userID: String? = nil,
            circleID: String? = nil,
            title: String? = nil,
            location: String? = nil,
            latitude: String? = nil,
            longitude: String? = nil,
            radius: String? = nil,
            timeSheetGpsOn: String? = nil,
            isNotification: String? = nil,
            status: String? = nil,
            createdAt: String? = nil,
            updatedAt: String? = nil,
            createdBy: String? = nil,
            active: String? = nil,
            members: [AddressMemberModel]? = nil
        ) -> LocationModel {
            return LocationModel(
                id: id ?? self.id,
                userID: userID ?? self.userID,
                circleID: circleID ?? self.circleID,
                title: title ?? self.title,
                location: location ?? self.location,
                latitude: latitude ?? self.latitude,
                longitude: longitude ?? self.longitude,
                radius: radius ?? self.radius,
                timeSheetGpsOn: timeSheetGpsOn ?? self.timeSheetGpsOn,
                isNotification: isNotification ?? self.isNotification,
                status: status ?? self.status,
                createdAt: createdAt ?? self.createdAt,
                updatedAt: updatedAt ?? self.updatedAt,
                createdBy: createdBy ?? self.createdBy,
                active: active ?? self.active,
                members: members ?? self.members
            )
        }

}

// MARK: - Address Member
struct AddressMemberModel: Codable {
    let circleID, userID, name, photo: String
    let latitude, longitude, address, userName: String
    let userImage, userLatitude, userLongitude, userAddress: String
    let notificationOnArrive, notificationOnLeave, isArrived, manualClockIn: String
    let manualClockOut, autoClockIn, autoClockOut, isLocationShared: String

    enum CodingKeys: String, CodingKey {
        case circleID = "circle_id"
        case userID = "user_id"
        case name, photo, latitude, longitude, address
        case userName = "user_name"
        case userImage = "user_image"
        case userLatitude = "user_latitude"
        case userLongitude = "user_longitude"
        case userAddress = "user_address"
        case notificationOnArrive = "notification_on_arrive"
        case notificationOnLeave = "notification_on_leave"
        case isArrived = "is_arrived"
        case manualClockIn = "manual_clock_in"
        case manualClockOut = "manual_clock_out"
        case autoClockIn = "auto_clock_in"
        case autoClockOut = "auto_clock_out"
        case isLocationShared = "is_location_shared"
    }
}

let testLocations: [LocationModel] = [
    LocationModel(
        id: "1",
        userID: "user_01",
        circleID: "circle_01",
        title: "Home",
        location: "123 Main St, Springfield, IL, 123 Main St, Springfield, IL, IL, 123 Main St, Springfield, IL",
        latitude: "39.7817",
        longitude: "-89.6501",
        radius: "10",
        timeSheetGpsOn: "true",
        isNotification: "true",
        status: "active",
        createdAt: "2024-01-01T12:00:00Z",
        updatedAt: "2024-01-02T12:00:00Z",
        createdBy: "admin",
        active: "1",
        members: addressMemberTestData
    ),
    LocationModel(
        id: "2",
        userID: "user_02",
        circleID: "circle_02",
        title: "Office",
        location: "456 Elm St, Springfield, IL",
        latitude: "39.7831",
        longitude: "-89.6500",
        radius: "20",
        timeSheetGpsOn: "false",
        isNotification: "false",
        status: "inactive",
        createdAt: "2024-01-10T08:00:00Z",
        updatedAt: "2024-01-11T08:00:00Z",
        createdBy: "user_02",
        active: "1",
        members: addressMemberTestData
    ),
    LocationModel(
        id: "3",
        userID: "user_03",
        circleID: "circle_01",
        title: "Gym",
        location: "789 Oak St, Springfield, IL",
        latitude: "39.7800",
        longitude: "-89.6505",
        radius: "5",
        timeSheetGpsOn: "true",
        isNotification: "true",
        status: "active",
        createdAt: "2024-01-15T07:00:00Z",
        updatedAt: "2024-01-16T07:00:00Z",
        createdBy: "user_03",
        active: "1",
        members: addressMemberTestData
    )
]

// MARK: - Test Data for AddressMemberModel
let addressMemberTestData = [
    AddressMemberModel(
        circleID: "circle_01",
        userID: "user_101",
        name: "Alice Johnson",
        photo: "alice_photo.png",
        latitude: "40.730610",
        longitude: "-73.935242",
        address: "1600 Broadway, New York, NY",
        userName: "alicejohnson",
        userImage: "alice_image.png",
        userLatitude: "40.730610",
        userLongitude: "-73.935242",
        userAddress: "1600 Broadway, New York, NY",
        notificationOnArrive: "1",
        notificationOnLeave: "0",
        isArrived: "1",
        manualClockIn: "08:00",
        manualClockOut: "17:00",
        autoClockIn: "0",
        autoClockOut: "1",
        isLocationShared: "1"
    ),
    AddressMemberModel(
        circleID: "circle_01",
        userID: "user_102",
        name: "Bob Williams",
        photo: "bob_photo.png",
        latitude: "34.052235",
        longitude: "-118.243683",
        address: "123 Hollywood Blvd, Los Angeles, CA",
        userName: "bobwilliams",
        userImage: "bob_image.png",
        userLatitude: "34.052235",
        userLongitude: "-118.243683",
        userAddress: "123 Hollywood Blvd, Los Angeles, CA",
        notificationOnArrive: "0",
        notificationOnLeave: "1",
        isArrived: "0",
        manualClockIn: "09:00",
        manualClockOut: "18:00",
        autoClockIn: "1",
        autoClockOut: "0",
        isLocationShared: "1"
    ),
    AddressMemberModel(
        circleID: "circle_02",
        userID: "user_103",
        name: "Carlos Martinez",
        photo: "carlos_photo.png",
        latitude: "37.774929",
        longitude: "-122.419418",
        address: "789 Market St, San Francisco, CA",
        userName: "carlosmartinez",
        userImage: "carlos_image.png",
        userLatitude: "37.774929",
        userLongitude: "-122.419418",
        userAddress: "789 Market St, San Francisco, CA",
        notificationOnArrive: "1",
        notificationOnLeave: "1",
        isArrived: "1",
        manualClockIn: "07:30",
        manualClockOut: "16:30",
        autoClockIn: "0",
        autoClockOut: "1",
        isLocationShared: "0"
    )
]

