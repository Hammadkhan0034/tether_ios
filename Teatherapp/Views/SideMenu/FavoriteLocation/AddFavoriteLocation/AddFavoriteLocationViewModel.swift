//
//  AddFavoriteLocationViewModel.swift
//  Teatherapp
//
//  Created by Hammad Khan on 28/09/2024.
//
import Foundation
import Alamofire
class AddFavoriteLocationViewModel: ObservableObject{
    @Published var isShowingSelectAddress = false
    @Published var myPlaceModel = MyPlaceModel(name: "", latitude: 0, longitude: 0, description: "")
    @Published var title: String = ""
    @Published var note: String = ""
    @Published var shareWith: Int = 0
    @Published var errorMessage = ""
    @Published var isLoading = false
    @Published var showSnackBar = false
    @Published var showAlert = false
    @Published var successMessage = ""
//    TODO : Add attachmennt support
    
    
    func verifyData()->Bool{
        
        guard !title.isEmpty else {
            errorMessage = "Title is required"
            showAlert = true
            return false
        }
        guard !myPlaceModel.name.isEmpty else {
            errorMessage = "Address is required"
            showAlert = true
            return false
        }
        guard !note.isEmpty else {
            errorMessage = "Note is required"
            showAlert = true
            return false
        }
        
        
        
        return true
    }
    
    func saveLocation(){
        guard verifyData() else {
            return
        }
        
        
        isLoading = true
        Task{
            do{
                let params: Parameters = [
                    "TemporaryAccessCode":AppKeysConstant.temporaryAccessCode.getValue,
                    "UserName":AppConstants.userNameWithSpacesError.getValue,
                    "title":title,
                    "address": myPlaceModel.name,
                    "latitude":myPlaceModel.latitude,
                    "longitude": myPlaceModel.longitude,
                    "note":note,
                    "share_with": shareWith == 0 ? "team":"members",
                    "share_with_ids":[]
                    
                ]
                isLoading = true
                let res: ApiResponseModel =  try await APIManager.shared.postAsync(endpoint: Endpoints.saveFavoriteLocation, parameter: params)
                isLoading = false
                
                guard res.status == "1" else{
                    errorMessage = res.message
                    showAlert = true
                    return
                }
                
                guard let data = res.data else{
                    errorMessage = "Did not get any data from server"
                    showAlert = true
                    return
                }
                
                let favoriteAddress: FavoriteAddressModel = FavoriteAddressModel(from: data)!
                print(favoriteAddress)
                successMessage = res.message
                showSnackBar = true
                print(res)
            } catch(let error){
                isLoading = false
                print(error);
                
            }
        }
    }
    
    
}
