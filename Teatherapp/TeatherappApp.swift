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
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
           RootView(isLoggedIn: false)
        }
    }
}
