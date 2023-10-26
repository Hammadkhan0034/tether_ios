//
//  NotificationView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 15/09/2023.
//

import SwiftUI

struct NotificationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    dismiss()
                } label: {
                    Image("back_arrow_icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(10)
                        .background(Color.appBlue.opacity(0.1))
                        .clipShape(.circle)
                }
                
                Text("Notification")
                    .font(.system(size: 22))
                    .bold()
                    .padding(.leading, 8)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("filter_icon")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(4)
                }
                
                Button {
                    
                } label: {
                    Image("optionIcon")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(4)
                }
            }

            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NotificationView()
}
