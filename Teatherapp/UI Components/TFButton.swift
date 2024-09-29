//
//  TFButton.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 31/08/2023.
//

import SwiftUI

struct TFButton: View {
    
    let label : String
    let textColor: Color
    let backgroundColor: Color
    let width: Double
    let height: Double
    
    let onClick : ()->Void
    init(label: String, onClick: @escaping () -> Void, textColor: Color = Color.white, backgroundColor: Color = .appBlue, width: Double = .infinity, height: Double = 50) {
        self.label = label
        self.onClick = onClick
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.width = width
        self.height = height
    }
    var body: some View {
        Button(action: {
            onClick()
        }, label: {
            Text(label)
                .foregroundStyle(textColor)
                .font(.system(size: 20, weight: .bold))
                .frame(height: height)
                .frame(maxWidth: width)
                .background(Capsule().foregroundStyle(backgroundColor))
        })
    }
}

#Preview {
    TFButton(label: "Test Button",onClick: {
        
    } )
}
