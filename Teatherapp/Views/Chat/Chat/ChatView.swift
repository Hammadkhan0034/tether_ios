//
//  ChatView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 15/09/2023.
//

import SwiftUI

struct ChatView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel =  ChatViewModel()
    
//    @StateObject var chatRoom : ChatRoom = ChatRoom(id: 0, personOne: nil, personTwo: nil, messages: [
//        MessageModel(id: 0,text: "Hi there how are you"),
//        MessageModel(id: 1,text: "Hi there how are you"),
//        MessageModel(id: 2,text: "Hi there how are you"),
//        MessageModel(id: 3,text: "Hi there how are you"),
//        MessageModel(id: 4,text: "Hi there how are you"),
//        MessageModel(id: 5,text: "Hi there how are you"),
//        MessageModel(id: 6,text: "Hi there how are you"),])
    
    @State var msg : String = ""
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.white)
                }
                
                Image("userPlaceholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .padding(.leading,15)
                
                Text("Users Name")
                    .foregroundColor(.white)
                    .font(.system(size: 18).weight(.bold))
                
                Spacer()
            }
            .padding()
            .background(Color.appBlue)
            
            VStack{
                ScrollView{
                    VStack(alignment: .leading,spacing: 10){
//                        ForEach(chatRoom.messages.indices, id: \.self) {i in
//                            if chatRoom.messages[i].text != nil{
//                                chatBubble(text: chatRoom.messages[i].text!,isReceiver: i%2==0)
//                            }
//                        }
                    }
                    .padding(.top,getRelativeHeight(30))
                    .frame(width: getRelativeWidth(375))
                }
                .frame(width: getRelativeWidth(375))
                
                HStack{
                    TextField("Type Message",text: $msg)
                        .padding(.leading)
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "paperplane.fill")
                    })
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    func chatBubble(text:String,isReceiver:Bool)->some View{
        return Text(text)
            .padding(.horizontal,getRelativeWidth(10))
            .padding(.vertical,getRelativeHeight(10))
            .background(
                Capsule().foregroundColor(Color(red: 1, green: 0.78, blue: 0).opacity(0.25))
            )
            .frame(width: getRelativeWidth(345),
                   alignment: isReceiver ? .leading:.trailing)
            .padding(isReceiver ? .leading:.trailing,getRelativeHeight(30))
            .padding(.bottom,getRelativeHeight(10))
    }
}

#Preview {
    ChatView()
}
