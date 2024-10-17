//
//  HomeAppBarView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 14/10/2024.
//

import SwiftUI

struct HomeAppBarView: View {
    @State var selectedOption = "Family"
    @State var isOpended = false
    var body: some View {
            HStack{
                Button(action:
                        {
                    print("tapped on the side bar")
                    
                    
                }, label: {
                    Image("menu_icon")
                        .padding(10)
                        .background(Capsule().fill(.white))
                }).shadow(radius: 1)
                Spacer()
                SimpleOutlinedDropdownButtonView(selectedOption: $selectedOption, isOpened: $isOpended)
                Spacer()
                
                //MARK: - Chat
                NavigationLink{
                    ConversationView().navigationBarBackButtonHidden(true)
                }label:{
                    ImageOnCircle(icon: "text.bubble.fill", radius: 18, circleColor: .white, imageColor: .appBlue,shadowRadius:1)
                }
                
                
            }.padding(.horizontal)
        
    }
}

#Preview {
    HomeAppBarView()
}
