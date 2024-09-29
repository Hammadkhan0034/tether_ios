//
//  SimpleCheckBox.swift
//  Teatherapp
//
//  Created by Hammad Khan on 29/09/2024.
//

import SwiftUI

struct SimpleCheckBox: View {
    let isChecked: Bool
    let onClick: ()->Void
    let title: String
    var body: some View {
        HStack{
            
                Image(systemName: isChecked ? "checkmark.square.fill" : "square").resizable().frame(width: 22,height: 22)
                .foregroundColor(.textBluishBlack ).onTapGesture(perform: onClick)
            Text(title).font(.headline).fontWeight(.medium)
        }
    }
}

#Preview {
    SimpleCheckBox(isChecked: false, onClick: {},title: "REQUIRED SECURITY PIN")
}

