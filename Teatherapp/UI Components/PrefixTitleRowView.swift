//
//  PrefixTitleRowView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 11/11/2024.
//

import SwiftUI

struct PrefixTitleRowView: View {
    let prefix: String
    let title: String
    let fontWeight: Font.Weight
    let width: CGFloat
    init(prefix: String, title: String, fontWeight: Font.Weight = .regular, width: CGFloat = 25) {
        self.prefix = prefix
        self.title = title
        self.fontWeight = fontWeight
        self.width = width
    }
    var body: some View {
        VStack{
            HStack{
                Image(systemName: prefix).resizable().frame(width: width,height: 30).foregroundStyle(.appBlue)
                Text(title).foregroundStyle(.appBlue).font(.title3).fontWeight(fontWeight).padding(.leading)
                Spacer()
                
                
            }.padding(.horizontal).padding(.top)
            
            Divider()
        }
    }
}

#Preview {
    PrefixTitleRowView(prefix: "bookmark.fill", title: "New Fav", fontWeight: .bold)
}
