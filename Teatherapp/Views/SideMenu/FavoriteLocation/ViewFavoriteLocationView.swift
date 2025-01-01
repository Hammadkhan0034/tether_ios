//
//  ViewFavoriteLocationView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 11/11/2024.
//

import SwiftUI

struct ViewFavoriteLocationView: View {
    @Environment(\.dismiss) var dismiss
    let favoriteLocation : FavoriteLocationModel
    var body: some View {
        VStack{
            HStack{
                Button(action: {dismiss()}, label: {            ImageOnCircle(icon: "arrow.left", radius: 24, circleColor: .backIconbackground, imageColor: .backIcon)
                    Text("Favorite Location").foregroundStyle(.textBluishBlack).font(.title3).bold()
                    
                    Spacer()
                    Image(systemName: "trash.fill").resizable().frame(width: 25,height: 30).foregroundStyle(.red)
                    
                })
                
            }.padding().background(Color.white.shadow(color: Color.black.opacity(0.5), radius: 3, x: 0, y: 0)
                .mask(Rectangle().padding(.bottom, -23)) /// here!
)
            
            PrefixTitleRowView(prefix: "bookmark.fill", title: favoriteLocation.title, fontWeight: .bold)
            PrefixTitleRowView(prefix: "mappin.and.ellipse", title: favoriteLocation.address)
            PrefixTitleRowView(prefix: "text.page.fill", title: favoriteLocation.note)
            PrefixTitleRowView(prefix: "circle.fill", title: favoriteLocation.title, width: 30)
            
            BackgroundViewWrapper(text: "Share with:  \(favoriteLocation.shareWith)")
//            List{
//                ForEach(favoriteLocation.shareWithList) { sharedWith in
//                    
//                }
//            }
            Spacer()
        }
    }
}

#Preview {
    ViewFavoriteLocationView( favoriteLocation: FavoriteLocationModel.sampleData1()
    )
}
