//
//  LocatonMemberRowView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 11/11/2024.
//

import SwiftUI
import asnycImage
//
struct LocatonMemberRowView: View {
    let member: MemberModel
    var body: some View {
        HStack{
            CAsyncImage(urlString: "https://images.freeimages.com/image/previews/762/sunset-cowboy-ride-5690199.jpg?fmt=webp&w=500") { image in
                image.resizable().frame(width: 70,height: 70).cornerRadius(radius: 70, corners: .allCorners)
            } placeholder: {
                Image(systemName: "person.circle.fill").resizable().frame(width: 70,height: 70).foregroundStyle(.gray.opacity(0.5))
            }
            
            Text(member.name).font(.title3).fontWeight(.semibold).foregroundStyle(.appBlue.opacity(0.8))
            Spacer()
        }.padding(.all).frame(width: UIScreen.screenWidth - 40).background(.sky).shadow(radius: 5).cornerRadius(radius: 15, corners: .allCorners)
    }
}

#Preview {
    LocatonMemberRowView(member: testMembers.first!)
}
