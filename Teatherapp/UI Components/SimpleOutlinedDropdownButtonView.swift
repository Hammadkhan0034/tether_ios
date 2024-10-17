//
//  SimpleOutlinedButton.swift
//  Teatherapp
//
//  Created by Hammad Khan on 14/10/2024.
//

import SwiftUI

struct SimpleOutlinedDropdownButtonView: View {
    @Binding var selectedOption: String
    @Binding var isOpened: Bool
    
    var body: some View {
        Button(action: {
            isOpened.toggle()
        }, label: {
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
    SimpleOutlinedDropdownButtonView(selectedOption: .constant("Family"), isOpened: .constant(true))
}
