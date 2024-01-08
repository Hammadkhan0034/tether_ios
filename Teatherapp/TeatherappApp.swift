//
//  TeatherappApp.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 31/08/2023.
//

import SwiftUI

@main
struct TeatherappApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @Environment(\.scenePhase) var scenePhase

    @StateObject var userAuth = UserAuth()
    @StateObject var tfModel = TFBottomBarModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                RootViewController()
                    .environmentObject(userAuth)
                    .environmentObject(tfModel)
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
