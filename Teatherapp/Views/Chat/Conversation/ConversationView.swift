//
//  ChatHome.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 15/09/2023.
//

import SwiftUI

struct ConversationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var viewModel =  ConversationViewController()
    
    
    var body: some View {
            ZStack(alignment: .bottomTrailing){
                VStack{
                    AppBarView(title: "Chat",textColor: .appBlue).padding(.horizontal)
                    
                    
                    
                    if viewModel.conversationList.isEmpty {
                        Spacer()
                        Text(viewModel.conversaationMessage)
                            .fontWeight(.bold)
                            .foregroundColor(Color.appBlue)
                    }
                    else {
                        
                        
                        List(0..<viewModel.conversationList.count, id: \.self) { index in
                            let conversationModel = viewModel.conversationList[index]
                            NavigationLink(destination: {
                                ChatView(conversationModel: conversationModel)
                            }, label: {
                                ConversationRowComponent(conversationModel: conversationModel)
                            }).buttonStyle(PlainButtonStyle()).listRowSeparator(.hidden)
                        }
                        .listStyle(.plain)
                    }
                    
                    Spacer()
                }
                .navigationBarBackButtonHidden()
                .overlay(self.viewModel.isLoading ? LoadingView(): nil)
                
                .onAppear {
                    Task {
                        await viewModel.getConversations()
                        
                    }
                }
                
                
                NavigationLink(destination: {
                    SelectChatMemberView().navigationBarBackButtonHidden(true)
                }, label: {
                    
                    Image(systemName: "message.circle.fill").resizable().frame(width: 60, height: 60).foregroundStyle(.appBlue).padding(.all)
                })
                
            }.overlay{
                if(viewModel.isLoading){
                    LoadingView()
                }
            }
        .alert(viewModel.errorString, isPresented: $viewModel.showingAlert){}
        }
    
}

#Preview {
    ConversationView()
}



//struct ConversationItemView : View {
//    @State var userImage : String
//    @State var userName : String
//    @State var userMessage : String
//    @State var time : String
//    
//    var body: some View {
//        HStack{
//            AsyncImage(url: URL(string: self.userImage)) { phase in
//                if let image = phase.image {
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 60,height: 60)
//                        .clipShape(.circle)
//                }
//                else {
//                    Image("userPlaceholder")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 60,height: 60)
//                        .clipShape(.circle)
//                }
//            }
//            
//            VStack(alignment: .leading){
//                Text(self.userName)
//                    .font(.system(size: 18).weight(.bold))
//                
//                HStack{
//                    Image(systemName: "checkmark")
//                        .resizable()
//                        .frame(width: 10, height: 10)
//                    
//                    Text(self.userMessage)
//                        .font(.system(size: 14))
//                        .foregroundColor(.gray)
//                    
//                    Spacer()
//                    
//                    Text(self.time)
//                        .font(.system(size: 12))
//                        .foregroundColor(.gray)
//                }
//            }
//        }
//    }
//}
