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
class ChatMemberViewController: ObservableObject{
    var membersList: [MemberModel] = []
    var isLoading = false
    var chatPlaceholderMessage : String = "Loading Members."
    var errorString = ""
    var showingAlert = false
    
    func getMembers() async {
        let params: Parameters = [
            "UserName" : AppKeysConstant.userName.getValue,
            "TemporaryAccessCode": AppKeysConstant.temporaryAccessCode.getValue,
            "circle_id": AppKeysConstant.circleID.getValue,
        ]
        do{
            isLoading = true
            
            let res: ApiGenericResponseModel<ChatMembersModel> =  try await APIManager.shared.postAsyncGeneric(endpoint: Endpoints.getCircleMembers, parameter: params)
            isLoading = false
            
            guard res.status == "1" else{
                errorString = res.message
                showingAlert = true
                return
            }
            if(res.data.members.isEmpty){
                chatPlaceholderMessage = "No Members Found."
                membersList.removeAll()
                return
            }
            res.data.members.forEach { member in
                if !membersList.contains(member) {
                    membersList.append(member)
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
