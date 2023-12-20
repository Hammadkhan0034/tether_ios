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
    @Published var apiSuccessFullyCalled : Bool = false
    
    var usersLocationModel : UsersLocationModel?
    
    func getLocations(userName : String,
                      temporaryAccessCode : String,
                      userID : String,
                      circleID: String){
        
        let params: Parameters = [
            "UserName":userName,
            "TemporaryAccessCode":temporaryAccessCode,
            "user_id":userID,
            "circle_id":circleID
        ]
        
        isLoading = true
        
        APIManager.shared.requestPOST(url: Services.Endpoint(.getUsersLocation), parameter: params) { result, error in
            
            if result != nil {
                
                print(String(data: try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted), encoding: .utf8)!)
                
                print("Data received from server successfully")
                
                do {
                    self.usersLocationModel = try JSONDecoder().decode(UsersLocationModel.self, from: result!)
                    
                    self.apiSuccessFullyCalled = true
                    self.isLoading = false
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
