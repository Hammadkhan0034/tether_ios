//
//  SignupViewModel.swift
//  Teatherapp
//
//  Created by Muhammad Qayyum on 20/10/2023.
//

import Foundation
import SwiftyJSON
import Alamofire
import SwiftUI

class SignupViewModel: ObservableObject {
    
    @Published var isLoading : Bool = false
    @Published var apiSuccessFullyCalled : Bool = false
    
    
    @Published var fname = "First"
    @Published var lname = "Name"
    @Published var username = "qwerty"
    @Published var email = "qwertgmail.com"
    @Published var password = "123456"
    @Published var phoneCode = "92"
    @Published var phoneNumber = "3001234561"
    @Published var address = "address"
    @Published var city = "city"
    @Published var state = "state"
    @Published var zipCode = "zip"
    
    @Published var timeZone = "Asia"
    
    @Published var isSecured: Bool = true
    var errorString = AppConstants.fieldsRequired
    
    
    
    
    
    
    @Published var showingAlert = false
    
    var signupModel : SignupModel?
    
    func validateData()-> Bool{
        if fname.isEmpty || lname.isEmpty || email.isEmpty || username.isEmpty || password.isEmpty || phoneCode.isEmpty || phoneNumber.isEmpty || address.isEmpty || timeZone.isEmpty {
            errorString = AppConstants.fieldsRequired
            return false
        }
        
        if(username.contains(" ")){
            errorString =  AppConstants.userNameWithSpacesError
            return false
        }
        
        guard email.isValidEmail else{
            errorString = AppConstants.invalidEmail
            return false
        }
        
        
        
        return true
    }
    
    func signUp() {
        
        guard validateData() else {
            showingAlert = true
            return
        }
        let params: Parameters = [
            "name" : fname + " " + lname,
            "email" : email,
            "username" : username,
            "password" : password,
            "phone_code" : phoneCode,
            "phone_number" : phoneNumber,
            "address" : address,
            "device_type" : "IOS",
            "time_zone" : timeZone,
            "device_id":UIDevice.current.identifierForVendor?.uuidString ?? "000",
        ]
        isLoading = true
        
        APIManager.shared.post(endpoint: Services.Endpoint(.signup), parameter: params, header: nil){ response in
            self.isLoading = false
            self.showingAlert = false
            
            switch response {
            case .success(let data):
                guard let userData = data else {
                    self.errorString = AppConstants.noDataError
                    self.showingAlert = true
                    return
                }
                
                
                do {
                    self.signupModel = try JSONDecoder().decode(SignupModel.self, from: userData)
                    
                    self.apiSuccessFullyCalled = true
                }
                catch {
                    self.errorString = AppConstants.noDataError
                    self.showingAlert = true
                }
                
                
                
            case .failure(let error):
                self.errorString = error.message
                self.showingAlert = true
            }
        }
        
    }
}
