
import Foundation
import Alamofire
import Observation

@Observable
class FavoriteLocationViewModel{
    
    
    var locations: [FavoriteAddressModel] = []
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

    func showMemberBottomSheet(location: LocationModel){
        selectedLocationId = location.id
        isShowingBottomsheet = true
        
    }
    
    
    
    
    func getLocations()async{
            do{
                let params: Parameters = [
                    "TemporaryAccessCode":AppKeysConstant.temporaryAccessCode.getValue,
                    "UserName":AppKeysConstant.userName.getValue,
                    "user_id": AppKeysConstant.userID.getValue,
                    "circle_id": AppKeysConstant.circleID.getValue,
                ]
                
                isLoading = true
                let res: ApiGenericResponseModel<[FavoriteAddressModel]> =  try await APIManager.shared.postAsyncGeneric(endpoint: Endpoints.getFavoriteLocations, parameter: params)
                isLoading = false
                
                guard res.status == "1" else{
                    showAlert(message: res.message)
                    return
                }
                locations.removeAll()
                locations.append(contentsOf: res.data)
                } catch(let error){
                isLoading = false
                showAlert(message: error.localizedDescription)
                print(error);
                
            }
        

    }
    
}
