//
//  MessageViewModel.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 11/11/2023.
//

import Foundation
import SwiftyJSON
import Alamofire
import SwiftUI

class MessageViewModel: ObservableObject {
    
    @Published var isLoading : Bool = false
    @Published var apiSuccessFullyCalled : Bool = false
    
    var messageModel : MessageModel?
    
    func sendMessage(TemporaryAccessCode : String,
              UserName : String,
              circle_id : String,
              receiver_id : String,
              message : String){
        
        let params: Parameters = [
            "TemporaryAccessCode" : TemporaryAccessCode,
            "UserName" : UserName,
            "circle_id" : circle_id,
            "receiver_id" : receiver_id,
            "message" : message
        ]
        
        isLoading = true
        
        APIManager.shared.requestPOST(url: Services.Endpoint(.saveChat), parameter: params) { result, error in
            
            print(String(data: try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted), encoding: .utf8)!)
            
            if result != nil {

                print("Data received from server successfully")
                
                do {
                    self.messageModel = try JSONDecoder().decode(MessageModel.self, from: result!)
                    
                    self.apiSuccessFullyCalled.toggle()
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
