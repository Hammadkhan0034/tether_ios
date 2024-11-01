//
//  SimpleToggleTextButton.swift
//  Teatherapp
//
//  Created by Hammad Khan on 20/10/2024.
//

//
//  SimpleToggleButton.swift
//  Teatherapp
//
//  Created by Hammad Khan on 28/09/2024.
//

import SwiftUI

struct SimpleToggleTextButton: View {
    let title: String
    let isSelected: Bool
    let onclick: () ->Void
    let width: CGFloat?
    
    init(title: String, isSelected: Bool, onclick: @escaping () -> Void, width: CGFloat = 150) {
        self.title = title
        self.isSelected = isSelected
        self.onclick = onclick
        self.width = width
    }
    
    var body: some View {
        
        Button(action: onclick, label: {
            Text(title).font(.system(size: 16,weight: .regular)).foregroundStyle(isSelected ? .white : .textBluishBlack).padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                .frame(width: width, height: 45).background(isSelected ? .appBlue : .white).cornerRadius(radius: 5, corners: .allCorners)
        
        })
        
       }
}

#Preview {
    SimpleToggleTextButton(title: "Feet", isSelected: true, onclick: {})
}
