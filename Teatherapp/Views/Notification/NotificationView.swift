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
            .padding(.horizontal)
            .padding(.bottom)
            .background(Color.white)

            ScrollView(showsIndicators: false){
                NotificationItem()
                
                NotificationItem()
                
                NotificationItem()

            }
            .padding(.horizontal)
        }
        .background(Color.checkinGray.opacity(0.05))
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NotificationView()
}

struct NotificationItem: View {
    
    var body: some View {
        VStack(spacing:5){
            
            HStack{
                HStack{
                    Image(systemName: "calendar")
                        .foregroundColor(Color.appBlue)
                    
                    Text("01/04/2024")
                        .foregroundColor(Color.appBlue).fontWeight(.medium)
                }
                
                Spacer()
                
                HStack{
                    Image(systemName: "clock.fill")
                        .foregroundColor(Color.appBlue)
                    
                    Text("09:40 PM")
                        .foregroundColor(Color.appBlue).fontWeight(.medium)
                }
            }
            
            VStack{
                HStack {
                    ImageOnCircle(icon: "person.fill", radius: 30, circleColor: .red, imageColor: .white)
                    
                    VStack(alignment: .leading){
                        Text("Tether").font(.title3).fontWeight(.medium)
                        
                        Text("Tether has gone offline.")
                            .foregroundColor(.red).font(.headline)
                    }
                    
                    Spacer()
                }
                
                Text("FROM : Family")
                    .foregroundColor(Color.appBlue).fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.all)
            .background(.white)
            .cornerRadius(10)
            .shadow(radius: 2)
        }.padding(.bottom)
    }
}
