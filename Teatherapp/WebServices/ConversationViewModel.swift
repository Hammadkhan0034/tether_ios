//
//  ConversationViewModel.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 02/11/2023.
//

import Foundation
import SwiftyJSON
import Alamofire
import SwiftUI

class ConversationViewModel: ObservableObject {
    
    @Published var isLoading : Bool = false
    @Published var apiSuccessFullyCalled : Bool = false
    @Published var noConversation : Bool = false
    
    var conversationModel : ConversationModel?
    
    func conversation(TemporaryAccessCode : String,
                      UserName : String,
                      circle_id : String){
        
        let params: Parameters = [
            "TemporaryAccessCode" : TemporaryAccessCode,
            "UserName" : UserName,
            "circle_id" : circle_id
        ]
        
        self.isLoading = true
        
        APIManager.shared.requestPOST(url: Services.Endpoint(.getConversation), parameter: params) { result, error in

            print(String(data: try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted), encoding: .utf8)!)
            
            if result != nil {

                print("Data received from server successfully")
                
                do {
                    self.conversationModel = try JSONDecoder().decode(ConversationModel.self, from: result!)
                    
                    self.apiSuccessFullyCalled.toggle()
                    self.isLoading = false
                }
                catch {
                    print("Error:- \(error.localizedDescription)")
                    self.noConversation = true
                    self.isLoading = false
                }
            }
            else {
                
            }
        }
    }
}
