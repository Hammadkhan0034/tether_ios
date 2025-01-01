//
//  AddMemberPlaceHolder.swift
//  Teatherapp
//
//  Created by Hammad Khan on 01/01/2025.
//

import SwiftUI

struct AddMemberPlaceHolder: View {
    var body: some View {
        VStack{
            Spacer()
            Text("Add members to Send Messages").foregroundStyle(.appBlue).font(.headline)
            Text("At least one member needs to join your circle to be able to chat").foregroundStyle(.appBlue).font(.caption).multilineTextAlignment(.center)
            
            NavigationLink(destination: {
                Invite_Member_view().navigationBarBackButtonHidden(true)
            }, label: {
                
                Text("Add a new Member")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .bold))
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Capsule().foregroundStyle(.appBlue))
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 15, trailing: 15))
            })
            
            Spacer()
        }
    }
}

#Preview {
    AddMemberPlaceHolder()
}
