//
//  ChatController.swift
//  Teatherapp
//
//  Created by Hammad Khan on 01/01/2025.
//
import Foundation
import Alamofire
import Observation

@Observable
class ChatController: ObservableObject{
    var chatList: [ChatModel] = []
//    var conversationList: [ConversationModel] = [conversationTestData]
    var isLoading = false
    var message = ""
    var chatPlaceHolderMessage : String = "Loading Chat."
    var errorString = ""
    var showingAlert = false
    
    var isCameraPresented = false
    var capturedImage: UIImage?
    
    func getChat(connversationId: String, conversationType: String) async {
        let params: Parameters = [
            "UserName" : AppKeysConstant.userName.getValue,
            "TemporaryAccessCode": AppKeysConstant.temporaryAccessCode.getValue,
            "circle_id": AppKeysConstant.circleID.getValue,
            "conversation_id": connversationId,
            "conversation_type": conversationType,
        ]
        do{
            isLoading = true
            
            let res: ApiGenericResponseModel<[ChatModel]> =  try await APIManager.shared.postAsyncGeneric(endpoint: Endpoints.getChat, parameter: params)
            isLoading = false
            
            guard res.status == "1" else{
                errorString = res.message
                showingAlert = true

                return
            }
            
            if(res.data.isEmpty){
                chatPlaceHolderMessage = "No Messages Found."
                chatList.removeAll()
                return
            }
            res.data.forEach { chat in
                if !chatList.contains(chat) {
                    chatList.append(chat)
                        }
                    }
            
        } catch(let error){
            isLoading = false
            errorString = error.localizedDescription
            showingAlert = true

            print(error);
            
        }
        
    }
    
    func sendMessage(recieverId: String, groupId: String)async{
        var params: Parameters = [
            "UserName" : AppKeysConstant.userName.getValue,
            "TemporaryAccessCode": AppKeysConstant.temporaryAccessCode.getValue,
            "circle_id": AppKeysConstant.circleID.getValue,
            "receiver_id": recieverId,
            "message": message,
            
//            "attachments[]": capturedImage ,
        ]
        if(!groupId.isEmpty){
            params["group_id"] = groupId
        }
        do{
            
            let res: ApiGenericResponseModel<ChatModel> =  try await APIManager.shared.postAsyncGeneric(endpoint: Endpoints.saveChat, parameter: params)
            
            guard res.status == "1" else{
                errorString = res.message
                showingAlert = true
                return
            }
            message = ""
            capturedImage = nil
            chatList.append(res.data)
        } catch(let error){
            isLoading = false
            errorString = error.localizedDescription
            showingAlert = true
            print(error);
            
        }
    }
    
    
    
}
