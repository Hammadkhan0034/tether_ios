//
//  dashboardMap.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 07/09/2023.
//

import SwiftUI
import MapKit
import NSideMenu


struct DashboardMap: View {
    @Environment(\.dashboardVM) var dashboardVM
    @EnvironmentObject var tfModel: TFBottomBarModel
    @EnvironmentObject var userAuth : UserAuth
    
    @ObservedObject var options: NSideMenuOptions
    
    @State var showFilters : Bool = false
    @State var name : String = ""
    @State var userImage : String = ""
    
    @State var selectedView = "Home"
    @State var showBottomSheet = false
//    @State var selectedPlace: MyPlaceModel = MyPlaceModel(name: "", latitude: 0, longitude: 0,description: "")
    
    
    
    
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Map {
            }
            .edgesIgnoringSafeArea(.top)
            
            
            //MARK: - Google Map Ovelay View
            VStack(alignment: .trailing){
                
                HomeAppBarView(options: options)
                HomeAppBarSideColumnView()
                Spacer()
                
                HStack{
    
                    Button(action: {
                    }, label: {
                        Image(systemName: "map.fill")
                            .frame(width: 25, height: 25)
                            .padding(5)
                            .background(.white)
                            .clipShape(.circle)
                    })
                    
                    Spacer()
                    
                    //MARK: - SOS
                    NavigationLink(destination: {
                        SOSView()
                    }, label: {
                        HStack(spacing:2){
                            Image(systemName: "light.beacon.max.fill").frame(width: 25, height: 25)

                                .foregroundColor(Color.appBlue)
                            
                            Text("SOS").font(.caption).fontWeight(.semibold)
                                .foregroundColor(Color.appBlue)
                                
                        }
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                        .background(Capsule().fill(Color.white))
                        
                    })
                    
                    Spacer()
                    
                    //MARK: - Check in
//                    Button(action: {
//                        self.tfModel.selectedIndex = 3
//                    }, label: {
//                        HStack{
//                            Image(systemName: "clock.fill")
//                                .foregroundColor(.white)
//                            
//                            Text("CLOCKIN")
//                                .foregroundColor(.white)
//                                .fontWeight(.bold)
//                        }
//                        .padding(10)
//                        .background(Capsule().fill(Color.appBlue))
//                    })
                
                    
                    
                    //MARK: - Current Location
                    Button(action: {
                        
                    }, label: {
                        Image("img_gps")
                            .frame(width: 25, height: 25)
                            .padding(5)
                            .background(.white)
                            .clipShape(.circle)
                    })
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10))
                
                
            }.padding(.vertical,70)
                .overlay{
                    if tfModel.selectedIndex == 3 {
                        CheckinView()
                            .padding(.horizontal)
                    }
                }
        }.navigationBarTitle("",displayMode: .inline).navigationBarHidden(true)
            .onAppear{
                self.name = UserDefaults.standard.string(forKey: "name") ?? ""
                self.userImage = UserDefaults.standard.string(forKey: "photo") ?? ""
                Task{
                    await dashboardVM.getDashboardModel()
                }
            }
            .sheet(isPresented: $showBottomSheet, content: {
                CircleBottomsheetView()
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
