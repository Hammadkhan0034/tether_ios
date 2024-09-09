//
//  AppBarView.swift
//  Teatherapp
//
//  Created by Muhammad Hammad khan on 09-09-2024.
//

import SwiftUI

struct AppBarView: View {
    let title:String
    var body: some View {
        HStack{
            Text(title).foregroundStyle(.textBluishBlack).bold().font(.title2)
            Spacer()
            ImageOnCircle(icon: "arrow.left", radius: 24, circleColor: .backIconbackground, imageColor: .backIcon)
            
        }
    }
}

#Preview {
    AppBarView(title: "Invite Team Member")
}
