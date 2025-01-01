//
//  HomeAppBarView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 14/10/2024.
//

import SwiftUI
import NSideMenu
struct HomeAppBarView: View {
    @Environment(\.dashboardVM)  var dashboardVM
    @State var selectedOption = "Family"
    @ObservedObject var options: NSideMenuOptions
    @State var isOpended = false
    @State var isSideMenuOpened = false
    var body: some View {
        HStack{
            Button(action:
                    {
                if(isSideMenuOpened){
                    isSideMenuOpened = false
                    options.hideMenu()
                }else{
                    isSideMenuOpened = true
                    options.showMenu()
                }
            }, label: {
                Image("menu_icon")
                    .padding(10)
                    .background(Capsule().fill(.white))
            }).shadow(radius: 1)
            Spacer()
            SimpleOutlinedDropdownButtonView(selectedOption: selectedOption, isOpened: isOpended) {
                isOpended.toggle()
                dashboardVM.showCircleSheet.toggle()
            }
            Spacer()
            
            //MARK: - Chat
            NavigationLink{
                ConversationView().navigationBarBackButtonHidden(true)
            }label:{
                ImageOnCircle(icon: "text.bubble.fill", radius: 18, circleColor: .white, imageColor: .appBlue,shadowRadius:1)
            }
            
            
        }.padding(.horizontal).padding(.top,100)
        
    }
}
//
//#Preview {
//    HomeAppBarView(op)
//}
