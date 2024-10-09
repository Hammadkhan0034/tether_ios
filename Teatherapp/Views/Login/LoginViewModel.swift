//
//  LogInViewModel.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 20/10/2023.
//

import Foundation
import SwiftyJSON
import Alamofire
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var isLoading : Bool = false
    @Published var apiSuccessFullyCalled : Bool = false
    
    @Published var username = "malikazam"
    @Published var password = "123456789"
    
    @Published var isSecured: Bool = true
    
    @Published var showingAlert = false
    var errorString = AppConstants.fieldsRequired
    
    var loginModel : LoginModel?
    
    func validateData()-> Bool{
        if  username.isEmpty || password.isEmpty {
            errorString = AppConstants.fieldsRequired
            return false
        }
        
        if(username.contains(" ")){
            errorString =  AppConstants.userNameWithSpacesError
            return false
        }
        
        return true
    }
    
    func logIn(){
        
        guard validateData() else {
            showingAlert = true
            return
        }
        let params: Parameters = [
            "username":username,
            "password":password,
            "device_id":UIDevice.current.identifierForVendor?.uuidString ?? "000",
            "device_type":"IOS"
        ]
        
        isLoading = true
        
        APIManager.shared.post(endpoint: Services.Endpoint(.login), parameter: params, header: nil) { result in
            self.isLoading = false
            self.showingAlert = false
            switch result{
            case .success(let response):
                
                guard let userData = response else {
                    self.errorString = AppConstants.noDataError
                    self.showingAlert = true
                    return
                }
                do{
                    self.loginModel = try JSONDecoder().decode(LoginModel.self, from: userData)
                    UserDefaults.standard.setValue(true, forKey: "loggedIn")
                    self.apiSuccessFullyCalled = true
                    
                    let data = self.loginModel?.data
                    UserDefaults.standard.setValue(data?.name, forKey: "name")
                    UserDefaults.standard.setValue(data?.username, forKey: "username")
                    UserDefaults.standard.setValue(data?.photo, forKey: "photo")
                    UserDefaults.standard.setValue(data?.temporaryAccessCode, forKey: "temporaryAccessCode")
                    UserDefaults.standard.setValue(data?.circle.id, forKey: "circleID")
                    UserDefaults.standard.setValue(data?.userID, forKey: "userID")
                    UserDefaults.standard.setValue(data?.latitude, forKey: "latitude")
                    UserDefaults.standard.setValue(data?.longitude, forKey: "longitude")
                    print("Logged in")
                    return
                    
                }catch{
                    self.errorString = AppConstants.invalidDataFromserver
                    self.showingAlert = true
                    
                    return
                }
                
            case .failure(let error):
                self.errorString = error.message
                self.showingAlert = true
                
            }
            
        }
    }
    
    
}
