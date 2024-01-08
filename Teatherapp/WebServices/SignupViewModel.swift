//
//  SignupViewModel.swift
//  Teatherapp
//
//  Created by Muhammad Qayyum on 20/10/2023.
//

import Foundation
import SwiftyJSON
import Alamofire

class SignupViewModel: ObservableObject {
    
    @Published var isLoading : Bool = false
    @Published var apiSuccessFullyCalled : Bool = false
    
    var signupModel : SignupModel?

    func signUp(name : String,
                email : String,
                username: String,
                password : String,
                phoneCode : String,
                phoneNumber : String,
                address : String,
                deviceType: String,
                timeZone : String,
                deviceID : String) {
        
        let params: Parameters = [
            "name" : name,
            "email" : email,
            "username" : username,
            "password" : password,
            "phone_code" : phoneCode,
            "phone_number" : phoneNumber,
            "address" : address,
            "device_type" : deviceType,
            "time_zone" : timeZone,
            "device_id" : deviceID
        ]
        
        isLoading = true
        
        APIManager.shared.requestPOST(url: Services.Endpoint(.signup), parameter: params) { result, error in
            
            if result != nil {
                print(String(data: try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted), encoding: .utf8)!)
                print("Data received from server successfully")
                
                do {
                    self.signupModel = try JSONDecoder().decode(SignupModel.self, from: result!)
                    
                    self.apiSuccessFullyCalled = true
                    self.isLoading = false
                }
                catch {
                    print("Error:- \(error.localizedDescription)")
                }
            }
            else {
                
            }
        }
    }
}
