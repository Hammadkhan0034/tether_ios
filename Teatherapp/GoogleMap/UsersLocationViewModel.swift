//
//  UsersLocationViewModel.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 13/12/2023.
//

import Foundation
import SwiftyJSON
import Alamofire
import SwiftUI

class UsersLocationViewModel: ObservableObject {
    
    @Published var isLoading : Bool = false
    
    var usersLocationModel : UsersLocationModel?
    
    func logIn(UserName : String,
               TemporaryAccessCode : String,
               user_id : Int,
               circle_id: Int){
        
        let params: Parameters = [
            "UserName":UserName,
            "TemporaryAccessCode":TemporaryAccessCode,
            "user_id":user_id,
            "circle_id":circle_id
        ]
        
        isLoading = true
        
        APIManager.shared.requestPOST(url: Services.Endpoint(.getUsersLocation), parameter: params) { result, error in
            
            if result != nil {
                
                print(String(data: try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted), encoding: .utf8)!)
                
                print("Data received from server successfully")
                
                do {
                    self.usersLocationModel = try JSONDecoder().decode(UsersLocationModel.self, from: result!)
                    
                    UserDefaults.standard.setValue(true, forKey: "loggedIn")
                    
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
