//
//  SettingView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 14/09/2023.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var isAvailable : Bool
    
    var body: some View {
        
        NavigationView{
            VStack{
                HeaderBarView(title: "Family")
                    .padding(.horizontal)
                    .padding(.bottom)
                    .background(Color.white)
                
                VStack(spacing: 25){
                    Toggle(isOn: $isAvailable, label: {
                        Text("Unavailable")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                    })
                    .padding()
                    .frame(height: 60)
                    .background(Rectangle().fill(.white).cornerRadius(10))
                    
                    NavigationLink(destination: {PermissionLevelView().navigationBarBackButtonHidden(true)
                    }, label: {                SettingItemView(title: "Permission Level")
                    })
                    NavigationLink(destination: {
                        EditTeamProfileView().navigationBarBackButtonHidden(true)
                    }, label: {                SettingItemView(title: "Edit Team Profile")
                    })
                    NavigationLink(destination: {
                        LocationSharingView().navigationBarBackButtonHidden(true)
                    }, label: {                SettingItemView(title: "Location Sharing")
                    })
                    NavigationLink(destination: {
                        ManageBoostView().navigationBarBackButtonHidden(true)
                    }, label: {                SettingItemView(title: "Add Team Member")
                    })
                    NavigationLink(destination: {
                        DeleteTeamMemberView().navigationBarBackButtonHidden(true)
                    }, label: {                SettingItemView(title: "Delete Team Members")
                    })
                    
                    SettingItemView(title: "Delete Team")
                    
                    
                }
                .padding()
                
                Spacer()
            }
            .background(Color.appBlue.opacity(0.2))
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    SettingView(isAvailable: false)
}

struct SettingItemView: View {
    
    @State var title : String
    
    var body: some View {
        
            HStack{
                Text(self.title)
                    .foregroundColor(Color.black)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .accentColor(Color.appBlue)
                    .padding()
                    .background(Color.appBlue.opacity(0.1))
                    .clipShape(.circle)
            }
            .padding()
        
        .frame(height: 65)
        .background(Rectangle().fill(.white).cornerRadius(10))
        
    }
}
