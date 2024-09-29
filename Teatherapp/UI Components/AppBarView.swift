//
//  AppBarView.swift
//  Teatherapp
//
//  Created by Muhammad Hammad khan on 09-09-2024.
//

import SwiftUI

struct AppBarView: View {
    @Environment(\.dismiss) var dismiss
    let title:String
    var body: some View {
        HStack{
            Text(title).foregroundStyle(.textBluishBlack).bold().font(.title2)
            Spacer()
            Button(action: {dismiss()}, label: {            ImageOnCircle(icon: "arrow.left", radius: 24, circleColor: .backIconbackground, imageColor: .backIcon)
})
            
        }
    }
}

#Preview {
    AppBarView(title: "Invite Team Member")
}
