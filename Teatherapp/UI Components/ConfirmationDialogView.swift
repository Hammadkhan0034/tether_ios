//
//  ConfirmationDialogView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 25/10/2024.
//

import SwiftUI

struct ConfirmationDialogView: View {
    let title: String
    let description: String
    let onConfirm: ()->Void
    @Binding var showLocation: Bool
    var body: some View {
        ZStack{
            Color.black.opacity(0.2)
            VStack(alignment:.leading){
                Text(title).font(.title2).fontWeight(.semibold )
                Text(description).font(.callout).padding(.bottom)
                
                HStack{
                    Spacer()
                    Text("Cancel").fontWeight(.semibold).foregroundStyle(.red).onTapGesture {
                        showLocation = false
                    }.padding(.trailing)
                    Text("Confirm").fontWeight(.semibold).foregroundStyle(.red).onTapGesture(perform: onConfirm)
                }
            }.padding(.all).frame(width: UIScreen.screenWidth * 0.9).background(.white).cornerRadius(radius: 5, corners: .allCorners)
        }.ignoresSafeArea()
    }
}

#Preview {
    ConfirmationDialogView(title: "Remove Location", description: "Are you sure you want to Remove Location?", onConfirm: {
        print("heeelllloooo")
    }, showLocation: .constant(true))
}
