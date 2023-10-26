//
//  AppDelegate.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 21/10/2023.
//

import UIKit
import GoogleMaps

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            GMSServices.provideAPIKey("AIzaSyCiFbgYrKbvdSgwz3Tb-xrN4F18MFt5TO8")
            return true
        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
      }
}
