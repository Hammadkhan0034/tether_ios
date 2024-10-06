//
//  EditTeamProfileView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 06/10/2024.
//

import SwiftUI

struct EditTeamProfileView: View {
    
    @State var teamProfile: String = "Family"
    
    var body: some View {
        VStack(alignment:.leading){
            AppBarView(title: "")
            
            Text("Hey,").foregroundStyle(.appBlue).font(.largeTitle).bold()
            Text("Update Now.").foregroundStyle(.appBlue).font(.largeTitle).bold()
            
            SimpleTextField(placeHolder: "Family", inputField: $teamProfile)
            
            TFButton(label: "Update", onClick: {}).padding(.top)
            Spacer()
        }.padding(.horizontal)
    }
}

#Preview {
    EditTeamProfileView()
}
