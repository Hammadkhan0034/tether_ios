//
//  dashboardMap.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 07/09/2023.
//

import SwiftUI
import MapKit
import CoreLocationUI
import NSideMenu


struct DashboardMap: View {
    
    @EnvironmentObject var tfModel: TFBottomBarModel
    @EnvironmentObject var userAuth : UserAuth
    
    @ObservedObject var manager = LocationManager()
    
    @State var showFilters : Bool = false
    @State var name : String = ""
    @State var userImage : String = ""
    
    @State var selectedView = "Home"
    
    @StateObject var options = NSideMenuOptions(style: .scale, side: .leading, width: 220, showSkeletonStack: true, skeletonStackColor: .gray, cornerRaduisIfNeeded: 16,
                                                
                                                rotationDegreeIfNeeded: 8, onWillClose: {
        print("options:onWillClose!")
    }, onWillOpen: {
        print("options:onWillOpen!")
    }, onDidClose: {
        print("options:onDidClose!")
    }, onDidOpen: {
        print("options:onDidOpen!")
    })
    
    
    
    var body: some View {
        NavigationView{
            NSideMenuView(options: options){
                Menu{
                    SideMenuView(selectedView: $selectedView)
                }
                Main{
                    ZStack {
                        Map(coordinateRegion: $manager.region,
                            interactionModes: .all,
                            userTrackingMode: $manager.userTrackingMode,
                            annotationItems: manager.locations) { location in
                            MapAnnotation(coordinate: location.coordinate) {
                                ZStack {
                                    Image("marker")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 35, height: 35)
                                    
                                    AsyncImage(url: URL(string: "https://tether.mydispatchapp.com\(location.image)")) { phase in
                                        if let image = phase.image {
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 32, height: 32)
                                                .clipShape(.circle)
                                                .offset(y: -6)
                                        }
                                        else {
                                            Image(systemName: "person.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 32, height: 32)
                                                .clipShape(.circle)
                                                .offset(y: -6)
                                        }
                                    }
                                }
                            }
                        }
                        .edgesIgnoringSafeArea(.all)
                        
                        //MARK: - Google Map Ovelay View
                        VStack{
                            VStack{
                                HStack(alignment: .top){
                                    //MARK: - Menu
                                    Button(action: {
                                        print("tapped on the side bar")
                                        options.show.toggle()
    //                                    UserDefaults.standard.setValue(false, forKey: "loggedIn")
                                        
            //                            userAuth.logout()
                                    }, label: {
                                        Image("menu_icon")
                                            .padding(10)
                                            .background(Capsule().fill(.white))
                                    })
                                    
                                    Spacer()
                                    
                                    //MARK: - Banner
                                    HStack{
                                        Text("Family")
                                            .foregroundStyle(Color.appBlue)
                                            .padding(.leading,20)
                                        
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity, minHeight:40, maxHeight:40)
                                    .background(Capsule().fill(.white))
                                    
                                    VStack{
                                        //MARK: - Chat
                                        NavigationLink{
                                            ConversationView()
                                        }label:{
                                            Image(systemName: "text.bubble.fill")
                                                .frame(width: 25, height: 25)
                                                .padding(8)
                                                .background(.white)
                                                .clipShape(.circle)
                                        }
                                        
                                        //MARK: - Notification
                                        NavigationLink{
                                            NotificationView()
                                        }label:{
                                            Image(systemName: "bell.and.waves.left.and.right.fill")
                                                .frame(width: 25, height: 25)
                                                .padding(8)
                                                .background(.white)
                                                .clipShape(.circle)
                                        }
                                        //MARK: - Setting
                                        NavigationLink{
                                            SettingView(isAvailable: true)
                                        }label:{
                                            Image(systemName: "gearshape.fill")
                                                .frame(width: 25, height: 25)
                                                .padding(8)
                                                .background(.white)
                                                .clipShape(.circle)
                                        }
                                        
                                        Button{
                                            showFilters = !showFilters
                                        }label:{
                                            Image(showFilters ? "Cancel_Small" : "filter_icon")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .padding(8)
                                                .background(Color.white)
                                                .clipShape(.circle)
                                        }
                                    }
                                    .foregroundColor(Color.appBlue)
                                }
                                .padding(.horizontal)
                            }
                            
                            VStack(alignment:.trailing){
                                if showFilters{
                                    VStack{
                                        HStack{
                                            Spacer()
                                            Toggle(isOn: .constant(true)) {
                                                Text("Team Members")
                                                    .foregroundStyle(.red)
                                                    .font(.system(size: 16,weight: Font.Weight.bold))
                                            }
                                            .toggleStyle(iOSCheckboxToggleStyle()).frame(width: 200)
                                        }
                                        HStack{
                                            Spacer()
                                            Toggle(isOn: .constant(true)) {
                                                Text("Team Members")
                                                    .foregroundStyle(.red)
                                                    .font(.system(size: 16,weight: Font.Weight.bold))
                                            }
                                            .toggleStyle(iOSCheckboxToggleStyle()).frame(width: 200)
                                        }
                                        HStack{
                                            Spacer()
                                            Toggle(isOn: .constant(true)) {
                                                Text("Team Members")
                                                    .foregroundStyle(.red)
                                                    .font(.system(size: 16,weight: Font.Weight.bold))
                                            }
                                            .toggleStyle(iOSCheckboxToggleStyle()).frame(width: 200)
                                        }
                                    }
                                }
                            }
                            
                            Spacer()
                            
                            HStack{
                                Spacer()
                                
                                Button(action: {
                                    manager.toggleMapType()
                                }, label: {
                                    Image(systemName: "map.fill")
                                        .frame(width: 25, height: 25)
                                        .padding(10)
                                        .background(.white)
                                        .clipShape(.circle)
                                })
                                
                                Spacer()
                                
                                //MARK: - SOS
                                NavigationLink(destination: {
                                    SOSView()
                                }, label: {
                                    HStack{
                                        Image(systemName: "light.beacon.max.fill")
                                            .foregroundColor(Color.appBlue)
                                        
                                        Text("SOS")
                                            .foregroundColor(Color.appBlue)
                                            .fontWeight(.bold)
                                    }
                                    .padding(10)
                                    .background(Capsule().fill(Color.white))
                                    
                                })
                                
                                Spacer()
                                
                                //MARK: - Check in
                                Button(action: {
                                    self.tfModel.selectedIndex = 3
                                }, label: {
                                    HStack{
                                        Image(systemName: "clock.fill")
                                            .foregroundColor(.white)
                                        
                                        Text("CLOCKIN")
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                    }
                                    .padding(10)
                                    .background(Capsule().fill(Color.appBlue))
                                })
                                .opacity(manager.locations.count < 2 ? 0.0 : 100.0)
                                
                                Spacer()
                                
                                //MARK: - Current Location
                                Button(action: {
                                    
                                }, label: {
                                    Image("img_gps")
                                        .frame(width: 25, height: 25)
                                        .padding(10)
                                        .background(.white)
                                        .clipShape(.circle)
                                })
                                Spacer()
                            }
                            .padding(.horizontal,10)
                            .padding(.bottom,5)
                            
                            HStack(alignment: .center) {
                                let memberData  = manager.locations
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        ForEach(0..<memberData.count, id: \.self) { index in
                                            VStack{
                                                AsyncImage(url: URL(string: "https://tether.mydispatchapp.com\(memberData[index].image)")) { phase in
                                                    if let image = phase.image {
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: 40,height: 40)
                                                            .clipShape(.circle)
                                                    }
                                                    else {
                                                        Image("userPlaceholder")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: 40,height: 40)
                                                            .clipShape(.circle)
                                                    }
                                                }
                                                
                                                Text(memberData[index].name)
                                                    .font(.caption)
                                                    .foregroundColor(Color.appBlue)
                                            }
                                            .padding(.top, 10)
                                            .padding(.horizontal, 4)
                                        }
                                        
                                        if memberData.count < 1 {
                                            NavigationLink(destination: {
                                                Invite_Member_view().navigationBarBackButtonHidden(true)
                                            }, label: {
                                                Image(systemName: "plus")
                                                    .foregroundStyle(Color.white)
                                                    .padding(15)
                                                    .background(Color.appBlue)
                                                    .clipShape(.circle)
                                            })
                                        }
                                    }
                                }
                            }
                            .frame(minHeight: 80)
                            .background(Rectangle().fill(.white))
                        }.padding(.top,50)
                        .overlay{
                            if tfModel.selectedIndex == 3 {
                                CheckinView()
                                    .padding(.horizontal)
                            }
                        }
                    }

                }
            }
        
            
            .onAppear{
                self.name = UserDefaults.standard.string(forKey: "name") ?? ""
                self.userImage = UserDefaults.standard.string(forKey: "photo") ?? ""
            }        .environmentObject(options)

        }
        
       
    }
}

//#Preview {
//    DashboardMap()
//}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
