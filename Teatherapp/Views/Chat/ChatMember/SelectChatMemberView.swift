//
//  SelectChatMemberView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 06/10/2024.
//

import SwiftUI

struct SelectChatMemberView: View {
    var body: some View {
        NavigationView{
            VStack{
                AppBarView(title: "Select Member", textColor: .appBlue)
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
            }.padding()
        }
    }
}

#Preview {
    SelectChatMemberView()
}
