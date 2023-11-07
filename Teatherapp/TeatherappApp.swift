//
//  TeatherappApp.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 31/08/2023.
//

import SwiftUI
import GoogleMaps

@main
struct TeatherappApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        // disable log constraints
        UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    }
    
    @StateObject var locationManager = LocationManager()
    @StateObject var userAuth = UserAuth()
    
    var tfModel = TFBottomBarModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                if !userAuth.isLoggedin {
                    LoginView()
                        .environmentObject(userAuth)
                        .environmentObject(locationManager)
                }
                else {
                    HomeView()
                        .environmentObject(tfModel)
                        .environmentObject(userAuth)
                        .environmentObject(locationManager)
                }
            }
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                print("App is active")
                UIApplication.shared.applicationIconBadgeNumber = 0
            case .inactive:
                print("App is inactive")
            case .background:
                print("App is in background")
            @unknown default:
                print("Oh - interesting: I received an unexpected new value.")
            }
        }
    }
}
