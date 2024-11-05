//
//  SimpleOutlinedButton.swift
//  Teatherapp
//
//  Created by Hammad Khan on 14/10/2024.
//

import SwiftUI

struct SimpleOutlinedDropdownButtonView: View {
    let selectedOption: String
    let isOpened: Bool
    let onClick: ()->Void
    
    var body: some View {
        Button(action: onClick, label: {
            ZStack{
                
                RoundedRectangle(cornerRadius: 40).frame(height: 40).foregroundStyle(.white).shadow(radius: 1)
                
                
                HStack{
                    Text(selectedOption).font(.body).foregroundStyle(.appBlue).padding(.horizontal)
                    
                    Spacer()
                    
                    Image(systemName: isOpened ? "arrowtriangle.up.fill":"arrowtriangle.down.fill").resizable().frame(width: 10,height: 10).padding(.horizontal)
                    
                }
            }.frame(width: UIScreen.screenWidth * 0.6,height: 40)
        })
    }
}

#Preview {
    SimpleOutlinedDropdownButtonView(selectedOption: "Family", isOpened:
                                        true, onClick: {})
}
