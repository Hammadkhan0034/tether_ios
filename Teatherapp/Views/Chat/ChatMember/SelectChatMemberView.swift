//
//  SelectChatMemberView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 06/10/2024.
//

import SwiftUI

struct SelectChatMemberView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var viewModel =  ChatMemberViewController()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing){
                VStack{
                    AppBarView(title: "Chat",textColor: .appBlue).padding(.horizontal)
                    
                    
                    
                    if viewModel.membersList.isEmpty {
                        if(viewModel.chatPlaceholderMessage == "Loading Members."){
                            Spacer()
                            Text(viewModel.chatPlaceholderMessage)
                                .fontWeight(.bold)
                                .foregroundColor(Color.appBlue)
                        }else{
                            AddMemberPlaceHolder()
                        }
                    }
                    else {
                        List(0..<viewModel.membersList.count, id: \.self) { index in
                            
                            let memberModel = viewModel.membersList[index]
                            NavigationLink(destination: {
//                                ChatView(conversationModel: conversationModel)
                            }, label: {
                                MemberRowComponent(memberModel: memberModel)
                            }).listRowInsets(EdgeInsets.init(top: 5, leading: 0, bottom: 5, trailing: 0))
                        }
                        .listStyle(.plain)
                    }
                    
                    Spacer()
                }
                .navigationBarBackButtonHidden()
                .overlay(self.viewModel.isLoading ? LoadingView(): nil)
                
                .onAppear {
                    Task {
                        await viewModel.getMembers()
                        
                    }
                }
                
                
                NavigationLink(destination: {
                    SelectChatMemberView().navigationBarBackButtonHidden(true)
                }, label: {
                    
                    Image(systemName: "message.circle.fill").resizable().frame(width: 60, height: 60).foregroundStyle(.appBlue).padding(.all)
                })
                
            }
        }

    }
}

#Preview {
    SelectChatMemberView()
}
