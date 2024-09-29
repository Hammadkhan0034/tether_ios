//
//  AddCheckInTitleView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 29/09/2024.
//

import SwiftUI

struct AddCheckInTitleView: View {
    @Binding var title: String
    @Binding var isChecked: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text("Title").font(.headline).fontWeight(.medium).padding(EdgeInsets(top: 10, leading: 17, bottom: 0, trailing: 20))
            SimpleTextField(placeHolder: "Enter title...", inputField: $title).padding(.horizontal)
            HStack{
                SimpleCheckBox(isChecked: isChecked, onClick: {
                    isChecked.toggle()
                },title: "REQUIRED SECURITY PIN").padding(.top)
            }.padding(EdgeInsets(top: 0, leading: 23, bottom: 10, trailing: 0))
        }.background(.white)
    }
}

#Preview {
    AddCheckInTitleView(title: .constant(""), isChecked: .constant(true))
}
