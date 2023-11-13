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
    
    var chatModel : ChatModel?
    
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
        
        self.isLoading = true
        
        APIManager.shared.requestPOST(url: Services.Endpoint(.getChat), parameter: params) { result, error in
            
            print(String(data: try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted), encoding: .utf8)!)
            
            if result != nil {

                print("Data received from server successfully")
                
                do {
                    self.chatModel = try JSONDecoder().decode(ChatModel.self, from: result!)
                    
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
