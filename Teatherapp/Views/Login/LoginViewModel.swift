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
    
    var loginModel : LoginModel?
    
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
        
        APIManager.shared.requestPOST(url: Services.Endpoint(.login), parameter: params) { result, error in
            
            if result != nil {
                
                print(String(data: try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted), encoding: .utf8)!)
                
                print("Data received from server successfully")
                
                do {
                    self.loginModel = try JSONDecoder().decode(LoginModel.self, from: result!)
                    
                    UserDefaults.standard.setValue(true, forKey: "loggedIn")
                    
                    self.apiSuccessFullyCalled = true
                    self.isLoading = false
                    
                    let data = self.loginModel?.data
                    
                    UserDefaults.standard.setValue(data?.name, forKey: "name")
                    UserDefaults.standard.setValue(data?.username, forKey: "username")
                    UserDefaults.standard.setValue(data?.photo, forKey: "photo")
                    UserDefaults.standard.setValue(data?.temporaryAccessCode, forKey: "temporaryAccessCode")
                    UserDefaults.standard.setValue(data?.circle.id, forKey: "circleID")
                    UserDefaults.standard.setValue(data?.userID, forKey: "userID")
                }
                catch {
                    print("Error:- \(error.localizedDescription)")
                    self.isLoading = false
                }
            }
            else {
                
            }
        }
    }
}
