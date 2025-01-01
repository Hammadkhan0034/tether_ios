//
//  ChatView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 15/09/2023.
//

import SwiftUI

struct ChatView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var chatViewModel =  ChatController()
    
   
    
    @State var position = 0
    
    
    let conversationModel: ConversationModel
    init(conversationModel: ConversationModel) {
       
        self.conversationModel = conversationModel
    }
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.white)
                }
                .padding(.trailing, 6)
                
                AsyncImage(url: URL(string: conversationModel.icon)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40,height: 40)
                            .clipShape(.circle)
                    }
                    else {
                        InitialsOnCircleView(name: conversationModel.name, radius: 30, circleColor: Color.red)
                    }
                }
                
                Text(conversationModel.name)
                    .foregroundColor(.white)
                    .font(.system(size: 18).weight(.bold))
                
                Spacer()
            }
            .padding()
            .background(Color.appBlue)
            ScrollViewReader { proxy in

            ScrollView {
                    ForEach(0..<chatViewModel.chatList.count, id: \.self) { index in
                        
                        MessageView(direction: chatViewModel.chatList[index].receiverName == conversationModel.name ? .right : .left) {
                            
                            HStack{
                                Text(chatViewModel.chatList[index].message)
                                    .font(.system(size: 16))
                                
                                Text(getTime(dateString: chatViewModel.chatList[index].createdAt))
                                    .font(.system(size: 10))
                                    .offset(y: 8)
                                
                            }
                            .padding(.all, 15)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                        }
                    }
                }.onChange(of: chatViewModel.chatList.count) {
                    // Scroll to the latest message when the messages array changes
                    if let lastMessageIndex = chatViewModel.chatList.indices.last {
                        withAnimation {
                            proxy.scrollTo(lastMessageIndex, anchor: .bottom)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            Spacer()
            HStack{
                HStack{
                    TextField("Type Message",text: $chatViewModel.message)
                        .padding(.leading, 6)
                        .submitLabel(.send)
                        .autocorrectionDisabled()
                        .onSubmit{
                            Task{
                                await chatViewModel.sendMessage(recieverId: conversationModel.receiverID,groupId: conversationModel.groupID)
                            }
                        }
                    
                    Button(action: {
                        Task{
                            chatViewModel.isCameraPresented = true
                        }
                    }, label: {
                        Image(systemName: "paperclip")
                    })
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding()
                
                Image(systemName: "paperplane.circle.fill").resizable().frame(width: 45,height: 45).foregroundStyle(Color.appBlue).padding(.trailing).onTapGesture {
                    Task{
                        await chatViewModel.sendMessage(recieverId: conversationModel.receiverID, groupId: conversationModel.groupID)
                    }
                }

            }
            
        }
        .navigationBarBackButtonHidden()
        .overlay(self.chatViewModel.isLoading ? LoadingView(): nil)
        .alert(chatViewModel.errorString, isPresented: $chatViewModel.showingAlert){}
        .sheet(isPresented: $chatViewModel.isCameraPresented) {
            CameraPicker(image: $chatViewModel.capturedImage)
                }
        .onAppear{
            Task{
                await chatViewModel.getChat(connversationId: conversationModel.receiverID, conversationType: conversationModel.conType)
            }
        }
        
        
    }
}

#Preview {
    ChatView(conversationModel: conversationTestData)
}

