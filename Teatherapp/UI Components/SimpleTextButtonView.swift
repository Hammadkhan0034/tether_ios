//
//  SimpleTextButtonView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 28/09/2024.
//

import SwiftUI

struct SimpleTextButtonView: View {
    let title: String
    var width: Double
    let height: Double
    let textColor: Color
    let cornerRadius: CGFloat
    let fontWeight: Font.Weight
    let font: Font
    
    init(title: String, width: Double = 150, height: Double = 50, textColor: Color = .gray, cornerRadius: CGFloat = 8, fontWeight: Font.Weight = .semibold, font: Font = .body) {
        self.title = title
        self.width = width
        self.height = height
        self.textColor = textColor
        self.cornerRadius = cornerRadius
        self.fontWeight = fontWeight
        self.font = font
    }
    var body: some View {
        Text(title).font(font).foregroundColor(textColor).fontWeight(fontWeight)
            .frame(width: width , height: height)               .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(textColor, lineWidth: 1))

        
    }
        
}

#Preview {
    SimpleTextButtonView(title: "Select Date",width: UIScreen.screenWidth)
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
