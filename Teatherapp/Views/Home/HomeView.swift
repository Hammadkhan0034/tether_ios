//
//  HomeView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 04/09/2023.
//

import SwiftUI
import CoreLocation
import NSideMenu

struct Locations: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var coordinate: CLLocationCoordinate2D
}

struct HomeView: View {
    
    @EnvironmentObject var tfModel: TFBottomBarModel
    
    @StateObject var viewModel =  UsersLocationViewModel()
    @StateObject var manager = LocationManager()
    @Environment(\.dashboardVM) var dashboardVM

    
    @StateObject var sideMenuOptions = NSideMenuOptions(style: .scale, side: .leading, width: 220, showSkeletonStack: true, skeletonStackColor: .gray, cornerRaduisIfNeeded: 16, rotationDegreeIfNeeded: 8, onWillClose: {
        print("options:onWillClose!")
    }, onWillOpen: {
        print("options:onWillOpen!")
    }, onDidClose: {
        print("options:onDidClose!")
    }, onDidOpen: {
        print("options:onDidOpen!")
    })
    
    var body: some View {
        NSideMenuView(options: sideMenuOptions){
            Menu{
                SideMenuView(options:sideMenuOptions)
            }
            Main{
                VStack{
                    DashboardMap(options: sideMenuOptions, manager: manager)
                        .environmentObject(tfModel)
                    
                    TFBottomBar(manager: manager)
                        .environmentObject(tfModel)
                        .ignoresSafeArea()
                }
                .overlay(self.viewModel.isLoading ? LoadingView(): nil)
                .onAppear{
                    viewModel.getLocations(
                        userName: UserDefaults.standard.string(forKey: "username") ?? "",
                        temporaryAccessCode: UserDefaults.standard.string(forKey: "temporaryAccessCode") ?? "",
                        userID: UserDefaults.standard.string(forKey: "userID") ?? "",
                        circleID: UserDefaults.standard.string(forKey: "circleID") ?? ""
                    )
                    Task{
                        await dashboardVM.getDashboardModel()
                    }
                }
                .onChange(of: viewModel.apiSuccessFullyCalled) { newValue in
                    
                    DispatchQueue.main.async {
                        
                        if let  circlesArray = viewModel.usersLocationModel?.data.circles {
                            
                            for circle in circlesArray {
                                
                                if circle.id ==  UserDefaults.standard.string(forKey: "circleID") ?? "" {
                                    
                                    let members = circle.members
                                    
                                    for member in members {
                                        manager.locations.append(Locations(name: member.userName,
                                                                           image: String(member.photo.dropFirst()),
                                                                           coordinate: CLLocationCoordinate2D(latitude: Double("\(member.latitude)") ?? 0.0,
                                                                                                              longitude: Double("\(member.longitude)") ?? 0.0)))
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }}
}
