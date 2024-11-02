//
//  ManageLocationViewModel.swift
//  Teatherapp
//
//  Created by Hammad Khan on 24/10/2024.
//
import Foundation
import Alamofire
import Observation

@Observable
class ManageLocationViewModel{
    
    
     var locations: [LocationModel] = []
    var errorMessage = ""
    var successMessage = ""
     var isAlertPresented = false
     var isSnackbarPresented = false
     var isLoading = false
     var showConfirmation = false
    var selectedLocation : LocationModel?
     var isShowingBottomsheet = false
    var selectedLocationId = ""


    
    
    func showAlert(message: String){
        errorMessage = message
        isAlertPresented = true
    }
    
    func showDeleteLocationConfirmation(location: LocationModel){
        selectedLocation = location
        showConfirmation = true
    }
    
    func deleteLocation()async{
        showConfirmation = false
            do{
                let params: Parameters = [
                    "TemporaryAccessCode":AppKeysConstant.temporaryAccessCode.getValue,
                    "UserName":AppKeysConstant.userName.getValue,
                    "circle_id": AppKeysConstant.circleID.getValue,
                    "location_id": selectedLocation!.id
                ]
                
                isLoading = true
                let res: ApiResponseModelWithoutData =  try await APIManager.shared.postAsyncWithoutData(endpoint: Endpoints.removeLocation, parameter: params)
                isLoading = false
                
                guard res.status == "1" else{
                    showAlert(message: res.message)
                    return
                }
                
                locations.removeAll { locationModel in
                    locationModel.id == selectedLocation!.id
                }
                successMessage = res.message
                isSnackbarPresented = true
                selectedLocation = nil
                } catch(let error){
                isLoading = false
                showAlert(message: error.localizedDescription)
                print(error);
                
            
        }
        
        
    }
    func notificationLocation(location: LocationModel, circle_id: String)async{
       guard let index = locations.firstIndex (where:{
            $0.id == location.id
       }) else{
           return
       }
//        locations[index] = location.copy(isNotification: location.isNotification.toggle)
        
        do{
            let params: Parameters = [
                "TemporaryAccessCode":AppKeysConstant.temporaryAccessCode.getValue,
                "UserName":AppKeysConstant.userName.getValue,
                "location_id": location.id,
                "circle_id": circle_id,
                "is_notification": location.isNotification.toggle
                
            ]
            
            let res: ApiResponseModelWithoutData =  try await APIManager.shared.postAsyncWithoutData(endpoint: Endpoints.locationNotificationSettings, parameter: params)
            
            guard res.status == "1" else{
                showAlert(message: res.message)
                return
            }
            locations[index] = location.copy(isNotification: location.isNotification.toggle)

            } catch(let error){
            isLoading = false
            showAlert(message: error.localizedDescription)
            print(error);
            
        }
        
    }

    func showMemberBottomSheet(location: LocationModel){
        selectedLocationId = location.id
        isShowingBottomsheet = true
        
    }
    
    
    func shareLocation(_ selectedMembers: [String])async{
        do{
            let params: Parameters = [
                "TemporaryAccessCode":AppKeysConstant.temporaryAccessCode.getValue,
                "UserName":AppKeysConstant.userName.getValue,
                "location_id": selectedLocationId,
                "user_ids": selectedMembers,
                
            ]
            
            isLoading = true
            let res: ApiGenericResponseModel<LocationDataWithTotalCount> =  try await APIManager.shared.postAsyncGeneric(endpoint: Endpoints.shareLocationWithTeamMembers, parameter: params)
            isLoading = false
            
            guard res.status == "1" else{
                showAlert(message: res.message)
                return
            }
            
            successMessage = res.message
            isSnackbarPresented = true
            isShowingBottomsheet = false
            } catch(let error){
            isLoading = false
            showAlert(message: error.localizedDescription)
            print(error);
            
        }
    }
    
    
    func getLocations()async{
            do{
                let params: Parameters = [
                    "TemporaryAccessCode":AppKeysConstant.temporaryAccessCode.getValue,
                    "UserName":AppKeysConstant.userName.getValue,
                    "circle_id": AppKeysConstant.circleID.getValue,
                    
                ]
                
                isLoading = true
                let res: ApiGenericResponseModel<LocationDataWithTotalCount> =  try await APIManager.shared.postAsyncGeneric(endpoint: Endpoints.getCircleLocation, parameter: params)
                isLoading = false
                
                guard res.status == "1" else{
                    showAlert(message: res.message)
                    return
                }
                locations.removeAll()
                locations.append(contentsOf: res.data.locations)
                } catch(let error){
                isLoading = false
                showAlert(message: error.localizedDescription)
                print(error);
                
            }
        

    }
    
}
