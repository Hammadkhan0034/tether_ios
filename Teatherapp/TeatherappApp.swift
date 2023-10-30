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

    var body: some Scene {
        WindowGroup {
            RootView(isLoggedIn: false)
        }.onChange(of: scenePhase) { newScenePhase in
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
