//
//  TFCapsuleButton.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 05/09/2023.
//

import SwiftUI

struct TFCapsuleButton: View {
    
    let label:String
    let image:String
    let buttonColor:Color
    let textColor:Color
    
    var body: some View {
        Button(action: {}, label: {
            HStack{
                Image(systemName: image)
                    .foregroundColor(textColor)
                
                Text(label)
                    .foregroundColor(textColor)
                    .fontWeight(.bold)
            }
            .padding(10)
            .background(Capsule().fill(buttonColor))
        })
    }
}

#Preview {
    TFCapsuleButton(label: "Button", image: "clock.fill",buttonColor: .appBlue,textColor: Color.white)
}
