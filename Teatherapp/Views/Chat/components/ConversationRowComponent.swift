//
//  ConversationRowComponent.swift
//  Teatherapp
//
//  Created by Hammad Khan on 31/12/2024.
//

import SwiftUI

struct ConversationRowComponent: View {
    
    let conversationModel: ConversationModel
    
    var body: some View {
        
        HStack(alignment: .center){
            AsyncImage(url: URL(string: conversationModel.icon)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60,height: 60)
                        .clipShape(.circle)
                }
                else {
                    InitialsOnCircleView(name: conversationModel.name, radius: 30, circleColor: Color.red)
                }
            }.padding(.trailing,5)
            
                
                VStack(alignment: .leading){
                    HStack{
                        Text(conversationModel.name)
                            .font(.system(size: 16).weight(.semibold))
                        Spacer()
                        
                        Text(timeInterval(dateString: conversationModel.createdAt))
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        
                    }
                    
                    HStack{
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 10, height: 10)
                        
                        Text(conversationModel.message)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        
                       
                    }.padding(.bottom, 10)
                    
                } .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(.top, 10), alignment: .bottom
                )
        }
        }
    }


#Preview {
    ConversationRowComponent(conversationModel: conversationTestData)
}
