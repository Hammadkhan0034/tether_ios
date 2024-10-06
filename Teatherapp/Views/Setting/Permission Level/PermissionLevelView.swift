//
//  PermissionLevelView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 06/10/2024.
//

import SwiftUI

struct PermissionLevelView: View {
    var body: some View {
        VStack{
            AppBarView(title: "Permission Level")
            
            Spacer()
            Text("No Member Found!")
            Spacer()
        }.padding(.horizontal)
    }
}

#Preview {
    PermissionLevelView()
}
