//
//  CircleTopsheetView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 14/10/2024.
//

import SwiftUI

struct CircleBottomsheetView: View {
    @Environment(\.dashboardVM) var dashboardVM
    @State var circleViewModel = CircleViewModel()
    
    func selectCircle(circle: CircleModel?){
        dashboardVM.selectedCircle = circle
        circleViewModel.selectedCircleViewModel = circle
    }
    
    var body: some View {
        
            VStack{
                
                HStack{
//                    Image(systemName: "xmark").resizable().frame(width: 17, height: 17)
                    Spacer()
                    Text("Available Teams").font(.title2).fontWeight(.semibold)
                    Spacer()
                    Image(systemName: "person.badge.plus").resizable().frame(width: 25,height: 25).foregroundStyle(.appBlue)
                }.padding(EdgeInsets(top: 15, leading: 10, bottom: 0, trailing: 10))
                List(circleViewModel.circleList){circle in
                    CircleBottomsheetRowView(circleModel: circle, isSelected: circle.id == circleViewModel.selectedCircleViewModel?.id, onCircleClicked: {
                        selectCircle(circle: circle)
                    }, onClickPremium: {
                        
                    }, onClickBell: {
                        
                    }).listRowSeparator(.hidden).listRowInsets(.init())
                }.listStyle(.inset).listRowSpacing(0)

                HStack{
                    TFButton(label: "CREATE A TEAM", onClick: {},textSize: 17)
                    TFButton(label: "JOIN A TEAM", onClick: {},  textSize: 17)
                }.padding()
                
            
            
            }.onAppear {
                circleViewModel.circleList = dashboardVM.dashboardModel?.circles ?? []
//                circleViewModel.circleList = testCircles
                selectCircle(circle: circleViewModel.circleList.first)

            }
    }
}
struct CircleBottomsheetRowView: View {
    let circleModel: CircleModel
    let isSelected : Bool
    let onCircleClicked: () -> Void
    let onClickPremium: () -> Void
    let onClickBell: () -> Void
    
    var body: some View {
    
        
        ZStack{
            if(isSelected){
                Rectangle().frame(width: UIScreen.screenWidth, height: 80).foregroundColor(.blue.opacity(0.1))
            }
            HStack{
                ZStack(alignment:.bottomTrailing){
                    AsyncImage(url: URL(string: circleModel.circleImage)).frame(width: 50,height: 50).cornerRadius(radius: 50, corners: .allCorners)
                   
                    ZStack {
                        Circle().fill(.appBlue)
                            .frame(width: 20,height:20).shadow(radius: 5)
                        // Use this implementation for an SF Symbol
                        Image(systemName: "crown.fill")
                            .resizable()
                            .aspectRatio(1.0,contentMode: .fit)
                            .foregroundColor(.white).frame(width: 12,height: 12)
                    
                    }

                }.padding(.leading,10).onTapGesture(perform: onCircleClicked)
                VStack(alignment: .leading,spacing: -5){
                    Text(circleModel.circleName).font(.body).fontWeight(.semibold).lineLimit(1)
                    Text("  © Created By").font(.caption).foregroundStyle(.green)
                }.padding(.trailing,5).onTapGesture(perform: onCircleClicked)
                Spacer()
                TFButton(label: "MANAGE PREMIUM", onClick: {},width: 120,height: 25,textSize: 10,textWeight: .regular).shadow(color: .black.opacity(0.1), radius: 5)
                Image(systemName: "bell.circle.fill").resizable().frame(width: 25,height: 25).foregroundStyle(.appBlue).shadow(color: .black.opacity(0.1), radius: 5).padding(.trailing, 10)
                
            }.frame(width:UIScreen.screenWidth)
        }.frame(width:UIScreen.screenWidth , height: 80)

                
            
            
        }
    }




#Preview {
    CircleBottomsheetView()
}



let testMembers: [MemberModel] = [
    MemberModel(
        id: "1",
        circleID: "circle_1",
        userID: "user_123",
        role: "admin",
        accessType: "full",
        locationSharingOn: "true",
        isAvailable: "true",
        lastAvailableTime: "2023-10-01T12:00:00Z",
        autoUnavailableStatus: "none",
        isDefault: "false",
        sequence: "1",
        isNotification: "true",
        status: "active",
        createdAt: "2023-01-01T10:00:00Z",
        updatedAt: "2023-10-01T10:00:00Z",
        name: "John Doe John Doe",
        userName: "johnny",
        username: "johndoe",
        photo: "https://images.freeimages.com/image/previews/406/halloween-howler-5690014.jpg?fmt=webp&w=500",
        phoneCode: "+1",
        phoneNumber: "5551234567",
        zelloUsername: "zelloJohn",
        userEmail: "john@example.com",
        userImage: "http://example.com/user1.jpg",
        userLatitude: "34.0522",
        userLongitude: "-118.2437",
        userAddress: "123 Main St, Los Angeles, CA",
        latitude: "34.0522",
        longitude: "-118.2437",
        address: "123 Main St",
        city: "Los Angeles",
        state: "CA",
        tag: "vip",
        locationUpdateTime: "2023-10-01T12:00:00Z",
        battery: "85%",
        wifi: "connected",
        mobileData: "enabled",
        deviceID: "device_001"
    ),
    MemberModel(
        id: "2",
        circleID: "circle_1",
        userID: "user_456",
        role: "member",
        accessType: "limited",
        locationSharingOn: "false",
        isAvailable: "false",
        lastAvailableTime: "2023-09-25T10:00:00Z",
        autoUnavailableStatus: "busy",
        isDefault: "true",
        sequence: "2",
        isNotification: "false",
        status: "inactive",
        createdAt: "2023-02-01T10:00:00Z",
        updatedAt: "2023-09-30T10:00:00Z",
        name: "Jane Smith",
        userName: "janey",
        username: "janesmith",
        photo: "http://example.com/photo2.jpg",
        phoneCode: "+1",
        phoneNumber: "5559876543",
        zelloUsername: "zelloJane",
        userEmail: "jane@example.com",
        userImage: "http://example.com/user2.jpg",
        userLatitude: "34.0522",
        userLongitude: "-118.2437",
        userAddress: "456 Elm St, Los Angeles, CA",
        latitude: "34.0522",
        longitude: "-118.2437",
        address: "456 Elm St",
        city: "Los Angeles",
        state: "CA",
        tag: "standard",
        locationUpdateTime: "2023-09-25T10:00:00Z",
        battery: "50%",
        wifi: "disconnected",
        mobileData: "disabled",
        deviceID: "device_002"
    ),
    MemberModel(
        id: "3",
        circleID: "circle_2",
        userID: "user_789",
        role: "moderator",
        accessType: "partial",
        locationSharingOn: "true",
        isAvailable: "true",
        lastAvailableTime: "2023-10-01T15:00:00Z",
        autoUnavailableStatus: "none",
        isDefault: "false",
        sequence: "3",
        isNotification: "true",
        status: "active",
        createdAt: "2023-03-01T10:00:00Z",
        updatedAt: "2023-10-01T10:00:00Z",
        name: "Alex Johnson",
        userName: "alexj",
        username: "alexjohnson",
        photo: "http://example.com/photo3.jpg",
        phoneCode: "+1",
        phoneNumber: "5553219876",
        zelloUsername: "zelloAlex",
        userEmail: "alex@example.com",
        userImage: "http://example.com/user3.jpg",
        userLatitude: "34.0522",
        userLongitude: "-118.2437",
        userAddress: "789 Pine St, Los Angeles, CA",
        latitude: "34.0522",
        longitude: "-118.2437",
        address: "789 Pine St",
        city: "Los Angeles",
        state: "CA",
        tag: "premium",
        locationUpdateTime: "2023-10-01T15:00:00Z",
        battery: "70%",
        wifi: "connected",
        mobileData: "enabled",
        deviceID: "device_003"
    )
]
