//
//  PackageCard.swift
//  Teatherapp
//
//  Created by Hammad Khan on 27/09/2024.
//

import SwiftUI

struct PackageCard: View {
    var body: some View {
        ZStack(alignment: .top){
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundStyle(.white).frame(maxWidth:.infinity,minHeight: 300,maxHeight: 300).shadow(radius: 10)
            VStack{
                Spacer()
                Image(.premiumIcon)
                Text("Premium Package").bold()
                Text("Unlimit your team. Get things you truly need to keep yourself and your team organized and managed. TAP FOR MORE").font(.caption).padding(.horizontal)
                Spacer()
            }
            Text("1/1").multilineTextAlignment(.center).foregroundStyle(.appBlue).frame(width: 70,height: 30).background(.white).cornerRadius(radius: 30, corners: .allCorners).shadow(radius: 5).offset(y:-15)
            
        }.frame(height: 300)
    }
}

#Preview {
    PackageCard()
}
