//
//  DeleteTeamMemberView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 07/10/2024.
//

import SwiftUI

struct DeleteTeamMemberView: View {
    var body: some View {
        VStack{
            AppBarView(title: "Delete Team Members").padding(.horizontal)
            BackgroundViewWrapper(text: "Team Management")
            
            Text("No Member Found").font(.title3).foregroundStyle(.appBlue).padding(.top)
            
            Spacer()
        }
    }
}

#Preview {
    DeleteTeamMemberView()
}
