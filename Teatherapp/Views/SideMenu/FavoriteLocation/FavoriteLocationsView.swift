//
//  FavoriteLocationsView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 28/09/2024.
//

import SwiftUI

struct FavoriteLocationsView: View {
    var viewModel: FavoriteLocationViewModel = FavoriteLocationViewModel()
    var body: some View {
        NavigationView{
            VStack{
                AppBarView(title: "Favorite Location")
                Spacer()
                
                
                if(!viewModel.locations.isEmpty){
                    List(viewModel.locations){ location in
                        FavoriteLocationRowComponent(favoriteLocationModel:  location).listRowSeparator(.hidden).listRowInsets(EdgeInsets())
                    }.listStyle(.inset)
                }
                
                if(viewModel.isLoading != true && viewModel.locations.isEmpty)
                {
                    VStack{
                        Spacer()
                        
                        Image(systemName: "text.page.badge.magnifyingglass").resizable().frame(width: 40,height: 50).foregroundStyle(.appBlue)
                        Text("Unable to get favorite locations data").font(.headline)
                        Text("Please add a new favorite location").font(.caption)
                        Spacer()
                        
                    }
                }
                Spacer()
                NavigationLink(destination: {
                    AddFavoriteLocationView().navigationBarBackButtonHidden(true)
                }, label: {
                        Label(title: {Text("Add Favorite").font(.title3).fontWeight(.bold ).foregroundStyle(.white).padding(.leading)}, icon: {Image(systemName: "plus").font(.title3).fontWeight(.bold ).foregroundStyle(.white)}).frame(width: 240,height: 50,alignment: .center).background(.appBlue).cornerRadius(radius: 10, corners: .allCorners).shadow(radius: 10)
                    
                    
                }).navigationBarBackButtonHidden(true)
                
            }.padding(.horizontal)
            
        }
    }
}

#Preview {
    FavoriteLocationsView()
}
