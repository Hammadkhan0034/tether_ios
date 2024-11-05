
//
//  DashboardModel.swift
//  Teatherapp
//
//  Created by Hammad Khan on 30/10/2024.
//
import Foundation
import SwiftData
import Alamofire
import SwiftUI

@Observable
class DashboardModelViewModel{
    
    var dashboardModel : DashboardModel?
    var selectedCircle: CircleModel?
    var showCircleSheet = false

    
    var errorMessage = ""
    var successMessage = ""
    var isAlertPresented = false
    var isSnackbarPresented = false
    var isLoading = false
    var showConfirmation = false
    
    
    func showAlert(message: String){
        errorMessage = message
        isAlertPresented = true
    }
    
    func getDashboardModel()async{
        Task{
            do{
                let params: Parameters = [
                    "TemporaryAccessCode":AppKeysConstant.temporaryAccessCode.getValue,
                    "UserName":AppKeysConstant.userName.getValue,
                    "circle_id": AppKeysConstant.circleID.getValue,
                    "user_id": AppKeysConstant.userID.getValue
                ]
                isLoading = true
                let res: ApiGenericResponseModel<DashboardModel> =  try await APIManager.shared.postAsyncGeneric(endpoint: Endpoints.getUserDashboard, parameter: params)
                isLoading = false
                
                guard res.status == "1" else{
                    showAlert(message: res.message)
                    return
                }
                dashboardModel = res.data
                selectedCircle = dashboardModel?.circles.first
                } catch(let error){
                isLoading = false
                showAlert(message: error.localizedDescription)
                print(error);
                
            }
        }

    }
}
