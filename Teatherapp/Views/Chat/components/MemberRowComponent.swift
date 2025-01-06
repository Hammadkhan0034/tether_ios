//
//  MemberRowComponent.swift
//  Teatherapp
//
//  Created by Hammad Khan on 01/01/2025.
//


import SwiftUI

struct MemberRowComponent: View {
    
    let memberModel: MemberModel
    
    var body: some View {
        
        HStack(alignment: .center){
            AsyncImage(url: URL(string: memberModel.userImage)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60,height: 60)
                        .clipShape(.circle)
                }
                else {
                    InitialsOnCircleView(name: memberModel.name, radius: 30, circleColor: Color.red)
                }
            }.padding(.horizontal,10)
            
                
                VStack(alignment: .leading){
                        Text(memberModel.name)
                        .font(.system(size: 16).weight(.semibold)).padding(.bottom,1)
                        
    

                        
                    Text(memberModel.isAvailable == "0" ? "AVAILABLE" : "UNAVAILABLE")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        
                       
                    
                }
            Spacer()
        }.padding(.vertical, 10)
//            .overlay(
//            Rectangle()
//                .frame(height: 1)
//                .foregroundColor(.gray)
//                .padding(.top, 10), alignment: .bottom
//        )
        
        }
    
    }


#Preview {
    MemberRowComponent(memberModel: testMembers.first!)
}
