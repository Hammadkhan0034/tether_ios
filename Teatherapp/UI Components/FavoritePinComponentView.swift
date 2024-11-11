//
//  FavoritePinComponentView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 11/11/2024.
//

import SwiftUI

struct FavoritePinComponentView: View {
    let favoriteLocation: FavoriteLocationModel
    var body: some View {
        ZStack{
            Image("favoritePin").resizable().frame(width: 50,height: 60).foregroundStyle(.green)
            Text(String(favoriteLocation.shareWithList.getListLength())).foregroundStyle(.white).bold().offset(x: 6,y: 2)
        }


    }
    

}

#Preview {
    FavoritePinComponentView(favoriteLocation: FavoriteLocationModel.sampleData1())
}
