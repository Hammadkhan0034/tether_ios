//
//  DashboardMapComponentView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 10/11/2024.
//

import SwiftUI
import MapKit
struct DashboardMapComponentView: View {
    @Environment(\.dashboardVM)  var dashboardVM
    @State var position : MapCameraPosition = .userLocation(fallback: .automatic)

    var body: some View {
        Map(position: $position) {
            ForEach(dashboardVM.dashboardModel?.favouriteLocations ?? []) { location in
                
                Annotation(location.title, coordinate: .init(latitude: location.latitude.toDouble, longitude: location.longitude.toDouble)) {
                    FavoritePinComponentView(favoriteLocation: location)
                }
                         }
        }
    }
}

//#Preview {
//    @Previewable @State var dashboardVM : DashboardModelViewModel = DashboardModelViewModel();
////    DashboardMapComponentView(dashboardVM: dashboardVM)
//}





// Generate test data for DashboardModel
let testDashboardData = DashboardModel(
    circles: [
        CircleModel.sampleData1(),
        CircleModel.sampleData2(),
        CircleModel.sampleData3()
    ],
    circleSettings: CircleSettings(isNotification: "true"),
    favouriteLocations: testFavouriteLocations
)

// MARK: - CircleModel Extension with Sample Data
extension CircleModel {
    static func sampleData1() -> CircleModel {
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
            subscriptionPackage: SubscriptionPackage.sampleData2()
        )
    }
    
    static func sampleData2() -> CircleModel {
        return CircleModel(
            id: "2",
            userID: "1002",
            circleName: "Work Team",
            type: "Work",
            invitationCode: "INV2024WORK",
            codeGeneratedDate: "2024-10-30T12:00:00Z",
            status: "inactive",
            createdAt: "2024-03-01T08:00:00Z",
            updatedAt: "2024-10-05T08:00:00Z",
            name: "Office",
            userName: "JohnDoe",
            circleImage: "https://example.com/work_circle_image.png",
            locationSharingOn: "false",
            autoUnavailableStatus: "true",
            isAvailable: "false",
            lastAvailableTime: "2024-10-28T08:00:00Z",
            isNotification: "false",
            accessType: "public",
            userRole: "member",
            isClockedIn: "false",
            totalEasterEggs: "1",
            totalMembers: "10",
            totalLocations: "3",
            members: [
                MemberDashboardModel.sampleData3()
            ],
            subscriptionPackage: SubscriptionPackage.sampleData1()
        )
    }
    
    static func sampleData3() -> CircleModel {
        return CircleModel(
            id: "3",
            userID: "1003",
            circleName: "Friends Circle",
            type: "Friends",
            invitationCode: "INV2024FRIENDS",
            codeGeneratedDate: "2024-10-31T12:00:00Z",
            status: "active",
            createdAt: "2024-06-01T08:00:00Z",
            updatedAt: "2024-10-10T08:00:00Z",
            name: "Social",
            userName: "EmmaSmith",
            circleImage: "https://example.com/friends_circle_image.png",
            locationSharingOn: "true",
            autoUnavailableStatus: "false",
            isAvailable: "true",
            lastAvailableTime: "2024-10-30T18:00:00Z",
            isNotification: "true",
            accessType: "private",
            userRole: "admin",
            isClockedIn: "true",
            totalEasterEggs: "5",
            totalMembers: "8",
            totalLocations: "4",
            members: [
                MemberDashboardModel.sampleData1(),
                MemberDashboardModel.sampleData2()
            ],
            subscriptionPackage: SubscriptionPackage.sampleData1()
        )
    }
}

// MARK: - MemberDashboardModel Extension with Sample Data
extension MemberDashboardModel {
    static func sampleData1() -> MemberDashboardModel {
        return MemberDashboardModel(
            id: "1",
            circleID: "1",
            userID: "1001",
            role: "member",
            accessType: "public",
            locationSharingOn: "true",
            isAvailable: "true",
            lastAvailableTime: "2024-10-28T18:00:00Z",
            autoUnavailableStatus: "false",
            isDefault: "true",
            sequence: "1",
            isNotification: "true",
            status: "active",
            createdAt: "2024-01-01T08:00:00Z",
            updatedAt: "2024-10-01T08:00:00Z",
            name: "Alice Johnson",
            userName: "AliceJ",
            username: "AliceJ",
            photo: "https://example.com/alice_photo.png",
            phoneCode: "+1",
            phoneNumber: "1234567890",
            zelloUsername: "aliceZello",
            userEmail: "alice@example.com",
            userImage: "https://example.com/alice_user_image.png",
            userLatitude: "37.7749",
            userLongitude: "-122.4194",
            userAddress: "123 Main St",
            latitude: "37.7749",
            longitude: "-122.4194",
            address: "123 Main St",
            city: "San Francisco",
            state: "CA",
            tag: "Friend",
            locationUpdateTime: "2024-10-28T18:10:00Z",
            battery: "80%",
            wifi: "true",
            mobileData: "true",
            deviceID: "device123",
            breadcrumbIntervalTime: "10",
            breadcrumbIntervalDistance: "50",
            noOfLocationHistory: "15"
        )
    }
    
    static func sampleData2() -> MemberDashboardModel {
        return MemberDashboardModel(
            id: "2",
            circleID: "1",
            userID: "1002",
            role: "member",
            accessType: "private",
            locationSharingOn: "true",
            isAvailable: "false",
            lastAvailableTime: "2024-10-28T17:00:00Z",
            autoUnavailableStatus: "true",
            isDefault: "false",
            sequence: "2",
            isNotification: "false",
            status: "inactive",
            createdAt: "2024-01-02T08:00:00Z",
            updatedAt: "2024-10-02T08:00:00Z",
            name: "Bob Smith",
            userName: "BobS",
            username: "BobS",
            photo: "https://example.com/bob_photo.png",
            phoneCode: "+1",
            phoneNumber: "9876543210",
            zelloUsername: "bobZello",
            userEmail: "bob@example.com",
            userImage: "https://example.com/bob_user_image.png",
            userLatitude: "34.0522",
            userLongitude: "-118.2437",
            userAddress: "456 Market St",
            latitude: "34.0522",
            longitude: "-118.2437",
            address: "456 Market St",
            city: "Los Angeles",
            state: "CA",
            tag: "Coworker",
            locationUpdateTime: "2024-10-28T17:30:00Z",
            battery: "50%",
            wifi: "false",
            mobileData: "true",
            deviceID: "device456",
            breadcrumbIntervalTime: "15",
            breadcrumbIntervalDistance: "30",
            noOfLocationHistory: "10"
        )
    }
    
    static func sampleData3() -> MemberDashboardModel {
        return MemberDashboardModel(
            id: "3",
            circleID: "2",
            userID: "1003",
            role: "member",
            accessType: "public",
            locationSharingOn: "true",
            isAvailable: "true",
            lastAvailableTime: "2024-10-28T09:00:00Z",
            autoUnavailableStatus: "false",
            isDefault: "true",
            sequence: "3",
            isNotification: "true",
            status: "active",
            createdAt: "2024-01-05T08:00:00Z",
            updatedAt: "2024-10-10T08:00:00Z",
            name: "Charlie Lee",
            userName: "CharlieL",
            username: "CharlieL",
            photo: "https://example.com/charlie_photo.png",
            phoneCode: "+1",
            phoneNumber: "5551234567",
            zelloUsername: "charlieZello",
            userEmail: "charlie@example.com",
            userImage: "https://example.com/charlie_user_image.png",
            userLatitude: "40.7128",
            userLongitude: "-74.0060",
            userAddress: "789 Park Ave",
            latitude: "40.7128",
            longitude: "-74.0060",
            address: "789 Park Ave",
            city: "New York",
            state: "NY",
            tag: "Friend",
            locationUpdateTime: "2024-10-28T09:10:00Z",
            battery: "90%",
            wifi: "true",
            mobileData: "true",
            deviceID: "device789",
            breadcrumbIntervalTime: "5",
            breadcrumbIntervalDistance: "100",
            noOfLocationHistory: "20"
        )
    }
}


// Generate multiple test data for FavouriteLocation
let testFavouriteLocations = [
    FavoriteLocationModel.sampleData1(),
    FavoriteLocationModel.sampleData2(),
    FavoriteLocationModel.sampleData3()
]

// MARK: - FavouriteLocation Extension with Sample Data
extension FavoriteLocationModel {
    static func sampleData1() -> FavoriteLocationModel {
        return FavoriteLocationModel(
            id: "1",
            userID: "1001",
            circleID: "1",
            title: "Home",
            address: "123 Main St, San Francisco, CA",
            latitude: "37.7749",
            longitude: "-122.4194",
            note: "My residence, always accessible",
            shareWith: "team",
            createdAt: "2024-01-01T08:00:00Z",
            updatedAt: "2024-10-01T08:00:00Z",
            createdBy: "JaneDoe",
            totalAttachments: "2",
            attachments: [
                Attachment.sampleData1(),
                Attachment.sampleData2()
            ],
            shareWithList: .team([])
        )
    }
    
    static func sampleData2() -> FavoriteLocationModel {
        return FavoriteLocationModel(
            id: "2",
            userID: "1002",
            circleID: "2",
            title: "Office",
            address: "456 Market St, Los Angeles, CA",
            latitude: "34.0522",
            longitude: "-118.2437",
            note: "Office location, only for team members",
            shareWith: "members",
            createdAt: "2024-02-01T08:00:00Z",
            updatedAt: "2024-10-05T08:00:00Z",
            createdBy: "JohnDoe",
            totalAttachments: "1",
            attachments: [
                Attachment.sampleData3()
            ],
            shareWithList: .member([])
        )
    }
    
    static func sampleData3() -> FavoriteLocationModel {
        return FavoriteLocationModel(
            id: "3",
            userID: "1003",
            circleID: "3",
            title: "Vacation Spot",
            address: "789 Beach Blvd, Malibu, CA",
            latitude: "34.0259",
            longitude: "-118.7798",
            note: "A beautiful place to relax with family",
            shareWith: "members",
            createdAt: "2024-03-01T08:00:00Z",
            updatedAt: "2024-10-10T08:00:00Z",
            createdBy: "EmmaSmith",
            totalAttachments: "3",
            attachments: [
                Attachment.sampleData4(),
                Attachment.sampleData5(),
                Attachment.sampleData6()
            ],
            shareWithList: .team([])
        )
    }
}

// MARK: - Attachment Extension with Sample Data
extension Attachment {
    static func sampleData1() -> Attachment {
        return Attachment(
            id: "1",
            favouriteLocationID: "1",
            name: "home_image.png",
            path: "https://example.com/home_image.png",
            createdAt: "2024-01-01T08:00:00Z",
            updatedAt: "2024-01-02T08:00:00Z"
        )
    }
    
    static func sampleData2() -> Attachment {
        return Attachment(
            id: "2",
            favouriteLocationID: "1",
            name: "floor_plan.pdf",
            path: "https://example.com/floor_plan.pdf",
            createdAt: "2024-01-01T08:00:00Z",
            updatedAt: "2024-01-02T08:00:00Z"
        )
    }
    
    static func sampleData3() -> Attachment {
        return Attachment(
            id: "3",
            favouriteLocationID: "2",
            name: "office_plan.pdf",
            path: "https://example.com/office_plan.pdf",
            createdAt: "2024-02-01T08:00:00Z",
            updatedAt: "2024-02-02T08:00:00Z"
        )
    }
    
    static func sampleData4() -> Attachment {
        return Attachment(
            id: "4",
            favouriteLocationID: "3",
            name: "vacation_image_1.jpg",
            path: "https://example.com/vacation_image_1.jpg",
            createdAt: "2024-03-01T08:00:00Z",
            updatedAt: "2024-03-02T08:00:00Z"
        )
    }
    
    static func sampleData5() -> Attachment {
        return Attachment(
            id: "5",
            favouriteLocationID: "3",
            name: "vacation_image_2.jpg",
            path: "https://example.com/vacation_image_2.jpg",
            createdAt: "2024-03-01T08:00:00Z",
            updatedAt: "2024-03-02T08:00:00Z"
        )
    }
    
    static func sampleData6() -> Attachment {
        return Attachment(
            id: "6",
            favouriteLocationID: "3",
            name: "vacation_plan.pdf",
            path: "https://example.com/vacation_plan.pdf",
            createdAt: "2024-03-01T08:00:00Z",
            updatedAt: "2024-03-02T08:00:00Z"
        )
    }
}


// Generate multiple test data for SubscriptionPackage
let testSubscriptionPackages = [
    SubscriptionPackage.sampleData1(),
    SubscriptionPackage.sampleData2(),
    SubscriptionPackage.sampleData3()
]

// MARK: - SubscriptionPackage Extension with Sample Data
extension SubscriptionPackage {
    static func sampleData1() -> SubscriptionPackage {
        return SubscriptionPackage(
            id: "1",
            circleID: "1001",
            userID: "5001",
            subscriptionID: "sub001",
            packageID: "pkg001",
            packageName: "Basic Plan",
            noOfEmployees: "10",
            noOfLocationHistory: "50",
            noOfGeoFences: "3",
            noOfJobs: "10",
            noOfDispatchHistory: "20",
            noOfFavLocations: "5",
            noOfEasterEggs: "2",
            breadcrumbIntervalTime: "15",
            breadcrumbIntervalDistance: "100",
            createdOn: "2024-01-01T08:00:00Z",
            updatedOn: "2024-10-01T08:00:00Z",
            packagePriceID: "price001"
        )
    }
    
    static func sampleData2() -> SubscriptionPackage {
        return SubscriptionPackage(
            id: "2",
            circleID: "1002",
            userID: "5002",
            subscriptionID: "sub002",
            packageID: "pkg002",
            packageName: "Standard Plan",
            noOfEmployees: "50",
            noOfLocationHistory: "200",
            noOfGeoFences: "10",
            noOfJobs: "50",
            noOfDispatchHistory: "100",
            noOfFavLocations: "20",
            noOfEasterEggs: "5",
            breadcrumbIntervalTime: "10",
            breadcrumbIntervalDistance: "75",
            createdOn: "2024-02-01T08:00:00Z",
            updatedOn: "2024-10-02T08:00:00Z",
            packagePriceID: "price002"
        )
    }
    
    static func sampleData3() -> SubscriptionPackage {
        return SubscriptionPackage(
            id: "3",
            circleID: "1003",
            userID: "5003",
            subscriptionID: "sub003",
            packageID: "pkg003",
            packageName: "Premium Plan",
            noOfEmployees: "200",
            noOfLocationHistory: "1000",
            noOfGeoFences: "25",
            noOfJobs: "200",
            noOfDispatchHistory: "500",
            noOfFavLocations: "100",
            noOfEasterEggs: "10",
            breadcrumbIntervalTime: "5",
            breadcrumbIntervalDistance: "50",
            createdOn: "2024-03-01T08:00:00Z",
            updatedOn: "2024-10-03T08:00:00Z",
            packagePriceID: "price003"
        )
    }
}
