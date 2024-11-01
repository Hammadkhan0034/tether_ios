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
//    let members: [JSONAny]

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
//        case members
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
        createdBy: String
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
    }

    

    // Custom initializer
    init?(map: [String: Any]) {
        guard
            let id = map["id"] as? String,
            let userID = map["user_id"] as? String,
            let circleID = map["circle_id"] as? String,
            let title = map["title"] as? String,
            let location = map["location"] as? String,
            let latitude = map["latitude"] as? String,
            let longitude = map["longitude"] as? String,
            let radius = map["radius"] as? String,
            let timeSheetGpsOn = map["time_sheet_gps_on"] as? String,
            let isNotification = map["is_notification"] as? String,
            let status = map["status"] as? String,
            let createdAt = map["created_at"] as? String,
            let updatedAt = map["updated_at"] as? String,
            let createdBy = map["created_by"] as? String
//            let members = map["members"] as? [JSONAny]
        else {
            return nil
        }

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
//        self.members = members
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
        createdBy: "admin"
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
        createdBy: "user_02"
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
        createdBy: "user_03"
    )
]
