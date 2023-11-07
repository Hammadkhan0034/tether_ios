//
//  ChatViewModel.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 02/11/2023.
//

import Foundation
import SwiftyJSON
import Alamofire
import SwiftUI

class ChatViewModel: ObservableObject {
    
    @Published var isLoading : Bool = false
    @Published var apiSuccessFullyCalled : Bool = false
    
    func chat(TemporaryAccessCode : String,
              UserName : String,
              circle_id : String,
              conversation_id : String,
              conversation_type : String){
        
        let params: Parameters = [
            "TemporaryAccessCode" : TemporaryAccessCode,
            "UserName" : UserName,
            "circle_id" : circle_id,
            "conversation_id" : conversation_id,
            "conversation_type" : conversation_type
        ]
        
        isLoading = true
        
//        APIManager.shared.requestPOST(url: Services.Endpoint(.getChat), parameter: params) { jsonData, error in
//            
//            self.isLoading = false
//            
//            let json = JSON(jsonData ?? "")
//            
//            if error != nil {
//                
//                return
//            }
//            else {
//                if json != nil {
//                    UserDefaults.standard.setValue(json["access_token"].stringValue, forKey: "authToken")
//                    self.apiSuccessFullyCalled = true
//                }
//            }
//        }
    }
}
