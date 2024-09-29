//
//  EasterEggsView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 28/09/2024.
//

import SwiftUI

struct EasterEggsView: View {
    var body: some View {
        NavigationView{
            VStack{
                AppBarView(title: "Easter Eggs")
                Spacer()
                Text("No Easter Eggs").font(.title2).foregroundStyle(.appBlue).fontWeight(.semibold)
                Spacer()
                
                NavigationLink(destination: {
                    AddEasterEggView().navigationBarBackButtonHidden(true)
                }, label: {
                        Label(title: {Text("Add Easter Egg").font(.title3).fontWeight(.bold ).foregroundStyle(.white).padding(.leading)}, icon: {Image(systemName: "plus").font(.title3).fontWeight(.bold ).foregroundStyle(.white)}).frame(width: 240,height: 50,alignment: .center).background(.appBlue).cornerRadius(radius: 10, corners: .allCorners).shadow(radius: 10)
                    
                    
                }).navigationBarBackButtonHidden(true)
            }.padding(.horizontal)
            
        }
    }
}

#Preview {
    EasterEggsView()
}
