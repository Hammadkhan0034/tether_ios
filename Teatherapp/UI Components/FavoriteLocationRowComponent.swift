//
//  FavoriteLocationRowComponent.swift
//  Teatherapp
//
//  Created by Hammad Khan on 07/01/2025.
//

import SwiftUI

struct FavoriteLocationRowComponent: View {
    let favoriteLocationModel : FavoriteAddressModel
    var body: some View {
        VStack{
            HStack{
                Image("favoritePin").resizable().frame(width: 50,height: 50).foregroundStyle(.appBlue)
                
                VStack(alignment: .leading, spacing: 0){
                    Text(favoriteLocationModel.title).font(.title3).bold().foregroundStyle(.textBluishBlack).lineLimit(1).lineSpacing(-10)
                    Text(favoriteLocationModel.address).lineSpacing(0).font(.caption).fontWeight(.light ).foregroundStyle(.textBluishBlack).lineLimit(1...2)
                    Text("Note: "+favoriteLocationModel.note).lineSpacing(0).font(.caption).fontWeight(.light ).foregroundStyle(.red).lineLimit(1...2)
                       
                    
                    Text("Created By \(favoriteLocationModel.createdBy)").font(.caption).foregroundStyle(.green).padding(.horizontal,10).overlay {
                        RoundedRectangle(cornerSize: .init(width: 15, height: 15), style: .circular).foregroundStyle(.green.opacity(0.15))
                    }.padding(.top,5)
                }
                Spacer()
                
            }.padding(.horizontal)
            
            Rectangle().frame(height:1).foregroundStyle(.gray.opacity(0.5)).padding(.top,5)

        }
    }
}

#Preview {
    FavoriteLocationRowComponent(favoriteLocationModel: FavoriteAddressModel(
        from: [
            "id": "2",
            "user_id": "124",
            "circle_id": "789",
            "title": "Office",
            "address": "456 Elm Street, Metropolis",
            "latitude": "40.7128",
            "longitude": "-74.0060",
            "note": "Workplace address.",
            "share_with": "colleagues",
            "created_at": "2025-01-06T10:00:00Z",
            "updated_at": "2025-01-07T11:00:00Z",
            "created_by": "user",
            "total_attachments": "2"
        ])!)
}
