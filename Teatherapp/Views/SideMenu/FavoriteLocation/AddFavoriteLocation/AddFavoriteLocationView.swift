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
        
        VStack(alignment: .leading){
            AppBarView(title: "Add Favorite Location").padding(.horizontal)
            
            BackgroundViewWrapper(text: "Location Details")
            
            SimpleTextField(placeHolder: "Enter Title", inputField: $addFavoriteLocationViewModel.title).padding(.horizontal)
            SimpleTextField(placeHolder: "Enter Address", inputField: $addFavoriteLocationViewModel.title).padding(.horizontal)
            SimpleTextField(placeHolder: "Enter Notes", inputField: $addFavoriteLocationViewModel.title).padding(.horizontal)
            AddMediaButtonView().padding(.horizontal).padding()

            ShareWithView(selectedOption: $addFavoriteLocationViewModel.shareWith).padding(.top)
            
            
            TFButton(label: "ADD FAVORITE", onClick: {}).padding(.horizontal).padding(.top)
            Spacer()
        }    }
}

#Preview {
    AddFavoriteLocationView()
}
