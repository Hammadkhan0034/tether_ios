//
//  CircleTopsheetView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 14/10/2024.
//

import SwiftUI

struct CircleBottomsheetView: View {
    var body: some View {
        NavigationView{
            VStack{
                Rectangle().frame(height: 100).foregroundStyle(.white)
                
                HStack{
                    TFButton(label: "CREATE A TEAM", onClick: {})
                    TFButton(label: "JOIN A TEAM", onClick: {})
                }
                
            }
            
        }
    }
}

#Preview {
    CircleBottomsheetView()
}
