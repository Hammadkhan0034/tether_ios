//
//  HeaderBarView.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 24/10/2023.
//

import SwiftUI

struct HeaderBarView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var title : String
    
    var body: some View {
        HStack{
            Text(self.title)
                .font(.system(size: 22))
                .bold()
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Image("back_arrow_icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(10)
                    .background(Color.appBlue.opacity(0.1))
                    .clipShape(.circle)
            }
        }
    }
}
