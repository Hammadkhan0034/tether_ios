//
//  AppBarView.swift
//  Teatherapp
//
//  Created by Muhammad Hammad khan on 09-09-2024.
//

import SwiftUI

struct AppBarView: View {
    @Environment(\.dismiss) private var dismiss
    let title:String
    let textColor: Color
    
    init(title: String, textColor: Color = .textBluishBlack) {
        self.title = title
        self.textColor = textColor
    }
    
    var body: some View {
        HStack{
            Text(title).foregroundStyle(textColor).font(.title3).bold()
            Spacer()
            Button(action: {dismiss()}, label: {            ImageOnCircle(icon: "arrow.left", radius: 18, circleColor: .backIconbackground, imageColor: .backIcon)
})
            
        }
    }
}

#Preview {
    AppBarView(title: "Invite Team Member")
}
