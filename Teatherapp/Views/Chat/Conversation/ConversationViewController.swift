//
//  ConversationViewController.swift
//  Teatherapp
//
//  Created by Hammad Khan on 31/12/2024.
//

import Foundation
import SwiftUI
import Alamofire
@Observable
class ConversationViewController: ObservableObject{
    var conversationList: [ConversationModel] = []
    var isLoading = false
    var conversaationMessage : String = "Loading Conversations."
    var errorString = ""
    var showingAlert = false
    
    func getConversations() async {
        let params: Parameters = [
            "UserName" : AppKeysConstant.userName.getValue,
            "TemporaryAccessCode": AppKeysConstant.temporaryAccessCode.getValue,
            "circle_id": AppKeysConstant.circleID.getValue,
        ]
        do{
            isLoading = true
            
            let res: ApiGenericResponseModel<[ConversationModel]> =  try await APIManager.shared.postAsyncGeneric(endpoint: Endpoints.getConversations, parameter: params)
            isLoading = false
            
            guard res.status == "1" else{
                errorString = res.message
                showingAlert = true

                return
            }
            if(res.data.isEmpty){
                conversaationMessage = "No Conversation Found."
                conversationList.removeAll()
                return
            }
            res.data.forEach { conversation in
                if !conversationList.contains(conversation) {
                    conversationList.append(conversation)
                        }
                    }
            
        } catch(let error){
            isLoading = false
            errorString = error.localizedDescription
            showingAlert = true
            print(error);
            
        }
        
    }
    
}
