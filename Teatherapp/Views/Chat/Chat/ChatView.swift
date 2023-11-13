//
//  ChatView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 15/09/2023.
//

import SwiftUI

struct ChatView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var chatViewModel =  ChatViewModel()
    @StateObject var messageViewModel =  MessageViewModel()
    
    @State var icon : String
    @State var name : String
    @State var conversationID : String
    @State var receiverID : String
    @State var conversationType : String
    
    @State var receiverName = ""
    @State var position = 0
    @State var messagesArray = [ChatModelData]()
    
    @State var message : String = ""
    
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
                
                AsyncImage(url: URL(string: self.icon)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40,height: 40)
                            .clipShape(.circle)
                    }
                    else {
                        Image("userPlaceholder")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40,height: 40)
                            .clipShape(.circle)
                    }
                }
                
                Text(self.name)
                    .foregroundColor(.white)
                    .font(.system(size: 18).weight(.bold))
                
                Spacer()
            }
            .padding()
            .background(Color.appBlue)
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<messagesArray.count, id: \.self) { index in
                        
                        MessageView(direction: messagesArray[index].receiverName == self.name ? .right : .left) {
                            
                            HStack{
                                Text(messagesArray[index].message)
                                    .font(.system(size: 16))
                                
                                Text(getTime(dateString: messagesArray[index].createdAt))
                                    .font(.system(size: 10))
                                    .offset(y: 8)
                                
                            }
                            .padding(.all, 15)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                        }
                    }
                    .onChange(of: position) { value in
                        withAnimation {
                            proxy.scrollTo(value, anchor: .center)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
//            .defaultScrollAnchor(.bottom)
            
            Spacer()
            
            HStack{
                TextField("Type Message",text: $message)
                    .padding(.leading, 6)
                    .submitLabel(.send)
                    .autocorrectionDisabled()
                    .onSubmit{
                        hideKeyboard()
                        sendMessage()
                    }
                
                Button(action: {
                    if !message.isEmpty {
                        hideKeyboard()
                        sendMessage()
                    }
                }, label: {
                    Image(systemName: "paperplane.fill")
                })
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            .padding()
        }
        .navigationBarBackButtonHidden()
        .overlay(self.chatViewModel.isLoading || self.messageViewModel.isLoading ? LoadingView(): nil)
        
        .onAppear{
            getChat()
        }
        .onChange(of: chatViewModel.apiSuccessFullyCalled) { newValue in
            
            if let arr = chatViewModel.chatModel?.data {
                let sortedArr = arr.sorted(by: {$0.createdAt > $1.createdAt})
                self.messagesArray.removeAll()
                self.messagesArray = sortedArr.reversed()
            }
        }
        .onChange(of: messageViewModel.apiSuccessFullyCalled) { newValue in
            self.message = ""
            getChat()
        }
    }
}

//#Preview {
//    ChatView()
//}

extension ChatView {
    
    func getChat() {
        chatViewModel.chat(TemporaryAccessCode: UserDefaults.standard.string(forKey: "temporaryAccessCode") ?? "",
                           UserName: UserDefaults.standard.string(forKey: "username") ?? "",
                           circle_id: UserDefaults.standard.string(forKey: "circleID") ?? "",
                           conversation_id: self.conversationID,
                           conversation_type: self.conversationType)
    }
    
    func sendMessage() {
        messageViewModel.sendMessage(TemporaryAccessCode: UserDefaults.standard.string(forKey: "temporaryAccessCode") ?? "",
                                     UserName: UserDefaults.standard.string(forKey: "username") ?? "",
                                     circle_id: UserDefaults.standard.string(forKey: "circleID") ?? "",
                                     receiver_id: self.receiverID,
                                     message: self.message)
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
