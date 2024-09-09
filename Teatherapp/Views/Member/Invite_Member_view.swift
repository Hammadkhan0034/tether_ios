//
//  Invite_Member_view.swift
//  Teatherapp
//
//  Created by Muhammad Hammad khan on 08-09-2024.
//

import SwiftUI

struct Invite_Member_view: View {
    @State var selectedPermissionLevel: PermissionLevels=PermissionLevels.fullAccess
    var body: some View {
        NavigationView{
            VStack(alignment:.leading){
                AppBarView(title: "Invite Team Member")
                Text("Share this invite code with the people you want in your circle:").bold().font(.title2).padding(.all)
                ZStack{
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundStyle(.yellow.opacity(0.2)).frame(maxWidth:.infinity,minHeight: 100,maxHeight: 100)
                    Text("Invite Id").bold().font(.largeTitle).foregroundStyle(.textBluishBlack)
                }
                
                Text("This code will be active for 3 days").fontWeight(.semibold).font(.title3).foregroundStyle(.blue).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center)
                Text("Share your code out loud or send it in a message").multilineTextAlignment(.center).foregroundStyle(.textBluishBlack).frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center)
                Text("Select Permission Level").bold().font(.title2)
                RadioView(selected: $selectedPermissionLevel, permissionLevel: PermissionLevels.fullAccess)
                RadioView(selected: $selectedPermissionLevel, permissionLevel: PermissionLevels.limitedAccess)
                RadioView(selected: $selectedPermissionLevel, permissionLevel: PermissionLevels.childAccess)
                
                Button("Send", action: {}).frame(maxWidth:  .infinity,minHeight: 50).background(.blue).foregroundStyle(.white).cornerRadius(radius: 50, corners:.allCorners)
                
                Text("If you want to add a new member to the circle then Click here.").fontWeight(.semibold).font(.body).multilineTextAlignment(.center).padding(.top)
                Spacer()
            }.padding(.horizontal)
        }
    }
}

#Preview {
    Invite_Member_view()
}


