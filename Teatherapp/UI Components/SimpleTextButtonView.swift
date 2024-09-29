//
//  SimpleTextButtonView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 28/09/2024.
//

import SwiftUI

struct SimpleTextButtonView: View {
    let title: String

    var body: some View {
                Text(title).foregroundColor(.gray).fontWeight(.semibold)
                            .frame(width: 150 , height: 50)               .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))

        
    }
        
}

#Preview {
    SimpleTextButtonView(title: "Select Date")
}
////
////  SimpleTextButtonView.swift
////  Teatherapp
////
////  Created by Hammad Khan on 28/09/2024.
////
//
//import SwiftUI
//
//struct SimpleTextButtonView: View {
//    let title: String
//    let onTap : ()->Void
//
//    var body: some View {
//        Button(action: onTap, label: {
//            HStack{
//                Text(title).foregroundColor(.gray).fontWeight(.semibold).padding(.leading)
//                Spacer()
//            }                .frame(height: 50)
//            
//                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
//        }
//        )
//    }
//        
//}
//
//#Preview {
//    SimpleTextButtonView(title: "Select Date and Time",onTap: {})
//}
