//
//  ChatHome.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 15/09/2023.
//

import SwiftUI

struct ChatHomeView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var users:[String] = ["Person","Person","Person","Person","Wahab","Person","Person","Person","Person"]
    
    var body: some View {
        
        VStack{
            HStack{
                Text("Chat")
                    .font(.system(size: 22).weight(.bold))
                    .foregroundColor(Color.appBlue)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image("back_arrow_icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding()
                        .background(Color.appBlue.opacity(0.1))
                        .clipShape(.circle)
                }
            }
            .padding(.horizontal)
            
            List {
                ForEach(users.indices, id: \.self) {i in
                    NavigationLink {
                        ChatView()
                    } label: {
                        HStack{
                            Image("userPlaceholder")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70,height: 70)
//                                .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.gray, lineWidth: 1))
                            
                            VStack(alignment: .leading,spacing: 0){
                                Text(users[i])
                                    .font(.system(size: 18).weight(.bold))
                                    .padding(.top,25)
                                    .padding(.bottom,5)
                                
                                Text("Hey how you doing!!")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                
                                Spacer()
                            }
                            .padding(.leading,10)
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ChatHomeView()
}
