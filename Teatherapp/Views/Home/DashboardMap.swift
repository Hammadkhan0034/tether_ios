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
    
    @EnvironmentObject var options: NSideMenuOptions
    @ObservedObject var manager = LocationManager()
    
    @State var showFilters : Bool = false
    @State var name : String = ""
    @State var userImage : String = ""
    
    @State var selectedView = "Home"
    @State var showBottomSheet = false
    @State var selectedPlace: Place = Place(name: "", latitude: 0, longitude: 0,description: "")
    

    
    
    
    var body: some View {
        NavigationView{
           
            ZStack(alignment: .top) {
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
                VStack(alignment: .trailing){
                            
                            HomeAppBarView()
                    HomeAppBarSideColumnView()
                            
                            
                            Spacer()
                            
                            HStack{
                                
                                TFButton(label: "test", onClick: {
                                    print("Testing Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")

                                    showBottomSheet.toggle()

                                })
                                
                            
                                
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
                }.padding(.top,70)
                        .overlay{
                            if tfModel.selectedIndex == 3 {
                                CheckinView()
                                    .padding(.horizontal)
                            }
                        }
            }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight).ignoresSafeArea().frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)

                
            }
        
            
            .onAppear{
                self.name = UserDefaults.standard.string(forKey: "name") ?? ""
                self.userImage = UserDefaults.standard.string(forKey: "photo") ?? ""
            }.sheet(isPresented: $showBottomSheet, content: {
                SimplePlacesSearchTextFieldView(selectedPlace: $selectedPlace)
            })

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
