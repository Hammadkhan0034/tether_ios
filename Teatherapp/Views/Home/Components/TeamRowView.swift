//
//  TeamRowView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 14/10/2024.
//

import SwiftUI

struct TeamRowView: View {
    var body: some View {
        ZStack{
            Rectangle().foregroundStyle(.sky).frame(height: 70)
            HStack{
                
                InitialsOnCircleView(initials: "Special Someones".initials, radius: 25, circleColor: .green).padding(.leading)
                VStack(alignment: .leading, spacing: 0){
                    Text("Special Someones").font(.body).fontWeight(.medium)
                    Text("Created by you").font(.caption).foregroundStyle(.green)
                }
                Spacer()
                
                TFButton(label: "GO PREMIUM", onClick: {},
                         textColor:.white, width: 100, height: 30, textSize: 12,
                         textWeight: .regular)
                Image(systemName: "bell.circle.fill").resizable().frame(width: 25,height: 25).foregroundStyle(.appBlue).padding(.trailing)
            
            }
        }
    }
}

#Preview {
    TeamRowView()
}
