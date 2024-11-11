//
//  HomeView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 04/09/2023.
//

import SwiftUI
import CoreLocation
import NSideMenu


struct HomeView: View {
    
    @EnvironmentObject var tfModel: TFBottomBarModel
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
                    DashboardMap(options: sideMenuOptions)
                        .environmentObject(tfModel)
                    
                    TFBottomBar()
                        .environmentObject(tfModel)
                }
                .overlay(self.dashboardVM.isLoading ? LoadingView(): nil)
                .onAppear{
                    Task{
                        await dashboardVM.getDashboardModel()
                    }
                }
            }
        }}
}
