//
//  SignupViewModel.swift
//  Teatherapp
//
//  Created by Muhammad Qayyum on 20/10/2023.
//

import Foundation
import Alamofire
import SwiftUI

@Observable
class AddNewMemberViewModel: ObservableObject {
    
    var isLoading : Bool = false
    var apiSuccessFullyCalled : Bool = false
    
    var selectedPermissionLevel: PermissionLevels = PermissionLevels.fullAccess
    var fname = "Malik"
    var lname = "Shahnawaz"
    var username = "malikshahnawaz1"
    var email = "shahnawazazam7331@gmail.com"
    var password = "123456789"
    var confirmPassword = "123456789"
    var hourlyRate = "12"
    var securityPin="1234"
    var phoneCode = "92"
    var phoneNumber = "3229969028"
    var address = "address"
    var city = "city"
    var state = "state"
    var zipCode = "zip"
    
    
    var isSecured: Bool = true
    var isConfirmSecured: Bool = true
    var errorString = AppConstants.fieldsRequired
    
    
    
    
    
    
    var showingAlert = false
    
    var signupModel : SignupModel?
    
    func validateData()-> Bool{
        if fname.isEmpty {
            errorString = "First name is required."
            return false
        }
        
        if lname.isEmpty {
            errorString = "Last name is required."
            return false
        }
        
        if email.isEmpty {
            errorString = "Email is required."
            return false
        }
        
        if username.isEmpty {
            errorString = "Username is required."
            return false
        }
        
        if password.isEmpty {
            errorString = "Password is required."
            return false
        }
        
        if confirmPassword.isEmpty {
            errorString = "Confirm password is required."
            return false
        }
        
        if hourlyRate.isEmpty {
            errorString = "Hourly rate is required."
            return false
        } else if let rate = Double(hourlyRate), rate < 0 {
            errorString = "Hourly rate must be a non-negative number."
            return false
        } else if Double(hourlyRate) == nil {
            errorString = "Hourly rate must be a valid number."
            return false
        }
        
        
        if securityPin.isEmpty {
            errorString = "Security PIN is required."
            return false
        }
        
        if phoneCode.isEmpty {
            errorString = "Phone code is required."
            return false
        }
        
        if phoneNumber.isEmpty {
            errorString = "Phone number is required."
            return false
        }
        
        if address.isEmpty {
            errorString = "Address is required."
            return false
        }
        
        if city.isEmpty {
            errorString = "City is required."
            return false
        }
        
        if state.isEmpty {
            errorString = "State is required."
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
        
        guard password == confirmPassword else{
            errorString = "Password and confirm password must be same."
            return false
        }
        
        
        return true
    }
    
    func addMember() async{
        
        guard validateData() else {
            showingAlert = true
            return
        }
        let deviceId = await UIDevice.current.identifierForVendor?.uuidString
        let params: Parameters = [
            "UserName" : AppKeysConstant.userName.getValue,
            "TemporaryAccessCode": AppKeysConstant.temporaryAccessCode.getValue,
            "circle_id": AppKeysConstant.circleID.getValue,
            "name" : fname + " " + lname,
            "email" : email,
            "username": username,
            "password" : password,
            "phone_code" : phoneCode,
            "phone_number" : phoneNumber,
            "address" : "\(address),\(city),\(state),zip code = \(zipCode)",
            "device_type" : "IOS",
            "time_zone" : TimeZone.current.identifier,
            "device_id": deviceId ?? "000",
        ]
        do{
            isLoading = true
            
            let res: ApiResponseModelWithoutData =  try await APIManager.shared.postAsyncWithoutData(endpoint: Endpoints.addMemberInCircle, parameter: params)
            isLoading = false
            
            guard res.status == "1" else{
                errorString = res.message
                return
            }
            // Todo : Add success snack bar
            apiSuccessFullyCalled = true
        } catch(let error){
            isLoading = false
            errorString = error.localizedDescription
            print(error);
            
        }
        
        
        
    }
    

}
