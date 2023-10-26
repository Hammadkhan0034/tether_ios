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
    
    func logIn(email : String,
               password : String,
               device_id : String,
               device_type: String){
        
        let params: Parameters = [
            "username":email,
            "password":password,
            "device_id":device_id,
            "device_type":device_type
        ]
        
        isLoading = true
        
        APIManager.shared.requestPOST(url: Services.getEndpoint(.login), parameter: params) { jsonData, error in
            
            self.isLoading = false
            
            let json = JSON(jsonData ?? "")
            
            if error != nil {
                
                return
            }
            else {
                if json != nil {
                    UserDefaults.standard.setValue(json["access_token"].stringValue, forKey: "authToken")
                    self.apiSuccessFullyCalled = true
                }
            }
        }
    }
}
