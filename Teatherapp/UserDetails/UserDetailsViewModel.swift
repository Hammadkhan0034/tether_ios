//
//  UserDetailsViewModel.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 10/11/2023.
//

import Foundation
import SwiftyJSON
import Alamofire
import SwiftUI

class UserDetailsViewModel: ObservableObject {
    
    @Published var isLoading : Bool = false
    @Published var apiSuccessFullyCalled : Bool = false
    
    var userDetailsModel : UserDetailsModel?
    
    func userDetails(UserName : String,
                     TemporaryAccessCode : String){
        
        let params: Parameters = [
            "UserName" : UserName,
            "TemporaryAccessCode" : TemporaryAccessCode
        ]
        
        isLoading = true
        
        APIManager.shared.requestPOST(url: Services.Endpoint(.getUserDetails), parameter: params) { result, error in
            
            if result != nil {
                
                print(String(data: try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted), encoding: .utf8)!)
                
                print("Data received from server successfully")
                
                do {
                    self.userDetailsModel = try JSONDecoder().decode(UserDetailsModel.self, from: result!)
                    
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
