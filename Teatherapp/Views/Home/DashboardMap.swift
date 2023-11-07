//
//  dashboardMap.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 07/09/2023.
//

import SwiftUI

struct DashboardMap: View {
    
    @EnvironmentObject var tfModel: TFBottomBarModel
    @EnvironmentObject var userAuth : UserAuth
    @EnvironmentObject var locationManager: LocationManager
    
    @State var showFilters : Bool = false
    
    @State var isCurrentLocation : Bool = false
    @State var isSatellite : Bool = false
    
    var body: some View {
        ZStack{
            //MARK: - Google Map
                GoogleMapsView(isSatellite: self.$isSatellite, isCurrentLocation: self.$isCurrentLocation)
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    .edgesIgnoringSafeArea(.all)
            
            //MARK: - Google Map Ovelay View
            VStack{
                VStack{
                    HStack(alignment: .top){
                        //MARK: - Menu
                        Button(action: {
                            UserDefaults.standard.setValue(false, forKey: "loggedIn")
                            userAuth.logout()
                        }, label: {
                            Image("menu_icon")
                                .padding()
                                .background(Capsule().fill(.white))
                        })
                        
                        Spacer()
                        
                        //MARK: - Banner
                        HStack{
                            Text("IOS Test")
                                .foregroundStyle(Color.appBlue)
                                .padding(.leading,20)
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, minHeight:50, maxHeight:50)
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
                                Image("filter_icon")
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
                        isSatellite = !isSatellite
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
                    
                    Spacer()
                    
                    //MARK: - Current Location
                    Button(action: {
                        isCurrentLocation = !isCurrentLocation
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
                
                HStack{
                    VStack{
                        Text("MI")
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .padding(10)
                            .background(.red)
                            .clipShape(.circle)
                        
                        Text("Muhammad")
                            .font(.caption)
                            .foregroundColor(Color.appBlue)
                    }
                    .padding(10)
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundStyle(Color.white)
                            .padding(15)
                            .background(Color.appBlue)
                            .clipShape(.circle)
                    })
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .background(Rectangle().fill(.white))
            }
            .overlay{
                if tfModel.selectedIndex == 3 {
                    CheckinView()
                        .padding(.horizontal)
                }
            }
        }
    }
}

//#Preview {
//    DashboardMap()
//}
