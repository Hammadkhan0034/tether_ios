//
//  AddNewLocationViewModel.swift
//  Teatherapp
//
//  Created by Hammad Khan on 20/10/2024.
//
import Foundation
import Alamofire
import Observation
@Observable
class AddNewLocationViewModel{

     var circleMembers: [MemberDashboardModel] = []
     var memberNotificationConfigList: [MemberNotificationSelectModel] = []
     var isFeetSelected = true
     var distance = 250.0
     var title = ""
     var myPlaceModel = MyPlaceModel(name: "", latitude: 0, longitude: 0, description: nil)
     var isShowingSelectAddress = false
     var selectAllArrives = false
     var selectAllLeaves = false
    var errorMessage = ""
    var successMessage = ""
     var isAlertPresented = false
     var isSnackbarPresented = false
     var isLoading = false

    func selectAllArivesList(){
        for i in 0..<memberNotificationConfigList.count {
            memberNotificationConfigList[i].whenArrives = selectAllArrives
        }
    }
    func selectAllLeavesList(){
        for i in 0..<memberNotificationConfigList.count {
            memberNotificationConfigList[i].whenArrives = selectAllArrives
        }
    }
    
    func showAlert(message: String){
        errorMessage = message
        isAlertPresented = true
    }
    
    func isDataValid()->Bool{
        
        guard !title.isEmpty else {
            showAlert(message: "Title is required")
            return false
        }
        
        guard !myPlaceModel.name.isEmpty || myPlaceModel.latitude != 0 || myPlaceModel.longitude != 0 else{
            showAlert(message: "Please select an Address")
            return false
        }
        
        return true
    }
    
    func saveLocation(goBack: ()-> Void) async{
        guard isDataValid() else {
            return
        }
        
            do{
                let params: Parameters = [
                    "TemporaryAccessCode":AppKeysConstant.temporaryAccessCode.getValue,
                    "UserName":AppKeysConstant.userName.getValue,
                    "title":title,
                    "circle_id": AppKeysConstant.circleID.getValue,
                    "location": myPlaceModel.name,
                    "latitude":myPlaceModel.latitude,
                    "longitude": myPlaceModel.longitude,
                    "radius":distance,
                    "employees":memberNotificationConfigList.map{$0.userId},
                    
                ]
                
                
                isLoading = true
                let res: ApiGenericResponseModel<LocationData> =  try await APIManager.shared.postAsyncGeneric(endpoint: Endpoints.saveLocation, parameter: params)
                isLoading = false
                
                guard res.status == "1" else{
                    showAlert(message: res.message)
                    return
                }
                
                successMessage = res.message
                isSnackbarPresented = true
                goBack()
            } catch(let error){
                isLoading = false
                showAlert(message: error.localizedDescription)
                print(error);
                
            }
        
    
        
    }
    
}


struct MemberNotificationSelectModel{
    let userId: String
    var whenArrives: Bool = false
    var whenLeaves: Bool = false
    
    }
