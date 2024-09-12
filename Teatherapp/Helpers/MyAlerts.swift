//
//  MyAlerts.swift
//  Teatherapp
//
//  Created by Muhammad Hammad khan on 12-09-2024.
//


import Foundation
import SwiftUI
struct AlertItem: Identifiable{
    let id = UUID()
    var title: Text
    var message: Text
    let dismissButton: Alert.Button
}


struct AlertContext{
    
   static func makeAlert(title: String="Error",message:String,onTap: (()-> Void)?)-> Alert{
        return Alert(title: Text(title), message: Text(message),dismissButton: .default(Text("Ok"),action: onTap))
    }
    
    static let incompleteData = AlertItem(title: Text("Error"), message: Text("Please fill all the fields."), dismissButton: .default(Text("OK")))
     static let invalidData = AlertItem(title: Text("Server Error"), message: Text("The data received from the server was invalid. Please contact support."), dismissButton: .default(Text("OK")))
    
    
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again or contact support."), dismissButton: .default(Text("OK")))
    
    static let invalidUrl = AlertItem(title: Text("Server Error"), message: Text("There was an issue connecting with the server. If this persists please contact support"), dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete your request at this time.Please check your internet connection."), dismissButton: .default(Text("OK")))
    
    
    
    static let invalidForm = AlertItem(title: Text("Form Error"), message: Text("Please make sure that all fields are filled."), dismissButton: .default(Text("OK")))
    static let invalidEmail = AlertItem(title: Text("Form Error"), message: Text("Please enter a valid email."), dismissButton: .default(Text("OK")))
    
    
    
    static let invalidUserData = AlertItem(title: Text("User Error"), message: Text("Invalid user data from AppStorage."), dismissButton: .default(Text("OK")))
    static let userSavedSuccess = AlertItem(title: Text("Save Profile"), message: Text("User profile information saved successfuly."), dismissButton: .default(Text("OK")))
    
    
}
