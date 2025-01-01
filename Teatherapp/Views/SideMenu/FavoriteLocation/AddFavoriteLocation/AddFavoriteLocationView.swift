//
//  AddFavoriteLocationView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 28/09/2024.
//

import SwiftUI

struct AddFavoriteLocationView: View {
    @StateObject var addFavoriteLocationViewModel = AddFavoriteLocationViewModel()
    var body: some View {
        ZStack{
            
            VStack(alignment: .leading){
                AppBarView(title: "Add Favorite Location").padding(.horizontal)
                
                BackgroundViewWrapper(text: "Location Details")
                
                SimpleTextField(placeHolder: "Enter Title", inputField: $addFavoriteLocationViewModel.title).padding(.horizontal)
                
                SimpleTextField(placeHolder: "Enter Address", inputField: $addFavoriteLocationViewModel.myPlaceModel.name,  isDisabled: true).padding(.horizontal).onTapGesture {
                    addFavoriteLocationViewModel.isShowingSelectAddress = true
                }
                SimpleTextField(placeHolder: "Enter Notes", inputField: $addFavoriteLocationViewModel.note).padding(.horizontal)
                
                MediaPickerButton { mediaType, media in
                    
                }
                
                
                ShareWithView(selectedOption: $addFavoriteLocationViewModel.shareWith).padding(.top)
                
                
                TFButton(label: "ADD FAVORITE", onClick: addFavoriteLocationViewModel.saveLocation).padding(.horizontal).padding(.top)
                Spacer()
            }
            
            if(addFavoriteLocationViewModel.isShowingSelectAddress)
            {
                GetAddressFromMapView(myPlaceModel: addFavoriteLocationViewModel.myPlaceModel, isActive: $addFavoriteLocationViewModel.isShowingSelectAddress)
            }
        }.overlay(SimpleToastView(message: addFavoriteLocationViewModel.successMessage, isShowing: $addFavoriteLocationViewModel.showSnackBar)).alert(addFavoriteLocationViewModel.errorMessage, isPresented: $addFavoriteLocationViewModel.showAlert) {
            
        }
        
    }
}


#Preview {
    AddFavoriteLocationView()
}
