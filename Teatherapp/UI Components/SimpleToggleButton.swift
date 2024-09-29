//
//  SimpleToggleButton.swift
//  Teatherapp
//
//  Created by Hammad Khan on 28/09/2024.
//

import SwiftUI

struct SimpleToggleButton: View {
    let image: String
    let title: String
    let isSelected: Bool
    let onclick: () ->Void
    let width: Double
    
    init(image: String, title: String, isSelected: Bool, onclick: @escaping () -> Void, width: Double = 130) {
        self.image = image
        self.title = title
        self.isSelected = isSelected
        self.onclick = onclick
        self.width = width
    }
    
    var body: some View {
        
        Button(action: onclick, label: {
            HStack{
                ZStack{
                    Circle().fill(.white)
                           .frame(width: 25, height: 25)
                    Image(systemName: image).foregroundStyle(isSelected ? .appBlue : .gray)
                    
                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                Text(title).font(.system(size: 16,weight: .bold)).foregroundStyle(.white).padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                Spacer()
            }.frame(width: width, height: 35).background(isSelected ? .appBlue : .gray).cornerRadius(radius: 35, corners: .allCorners)
        
        })
        
       }
}

#Preview {
    SimpleToggleButton(image: "snowflake", title: "Members", isSelected: false, onclick: {})
}
