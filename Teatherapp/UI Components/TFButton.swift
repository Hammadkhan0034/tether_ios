//
//  TFButton.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 31/08/2023.
//

import SwiftUI

struct TFButton: View {
    
    let label : String
    let onClick : ()->Void
    
    var body: some View {
        Button(action: {
            onClick()
        }, label: {
            Text(label)
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Capsule())
        })
    }
}

#Preview {
    TFButton(label: "Test Button",onClick: {
        
    } )
}
