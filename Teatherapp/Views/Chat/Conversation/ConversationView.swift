//
//  ChatHome.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 15/09/2023.
//

import SwiftUI

struct ConversationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel =  ConversationViewModel()
    
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
            
            if viewModel.noConversation {
                
                Spacer()
                
                Text("No Conversation Found.")
                    .fontWeight(.bold)
                    .foregroundColor(Color.appBlue)
            }
            else {
                if let conversationUserArray = viewModel.conversationModel?.data {
                    List(0..<conversationUserArray.count, id: \.self) { index in
                        
                        NavigationLink(destination: {
                            ChatView()
                        }, label: {
                            ConversationItemView(userImage: conversationUserArray[index].icon,
                                                 userName: conversationUserArray[index].name,
                                                 userMessage: conversationUserArray[index].message,
                                                 time: conversationUserArray[index].createdAt)
                        })
                    }
                    .listStyle(.plain)
                }
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .overlay(self.viewModel.isLoading ? LoadingView(): nil)
        
        .onAppear {
            getConversation()
        }
    }
}

#Preview {
    ConversationView()
}

extension ConversationView {
    
    func getConversation() {
        viewModel.conversation(TemporaryAccessCode: UserDefaults.standard.string(forKey: "temporaryAccessCode") ?? "",
                               UserName: UserDefaults.standard.string(forKey: "username") ?? "",
                               circle_id: UserDefaults.standard.string(forKey: "circleID") ?? "")
    }
}


struct ConversationItemView : View {
    @State var userImage : String
    @State var userName : String
    @State var userMessage : String
    @State var time : String
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: self.userImage)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60,height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                }
                else {
                    Image("userPlaceholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60,height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                }
            }
            
            VStack(alignment: .leading){
                Text(self.userName)
                    .font(.system(size: 18).weight(.bold))
                
                HStack{
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 10, height: 10)
                    
                    Text(self.userMessage)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text(self.time)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
