//
//  MenuView.swift
//  NSideMenuApp
//
//  Created by Najim on 12/2/21.
//

import SwiftUI
import NSideMenu

struct MenuView: View {
//    @EnvironmentObject var options: NSideMenuOptions
    @StateObject var options = NSideMenuOptions(style: .scale, side: .leading, width: 220, showSkeletonStack: false, skeletonStackColor: .white, cornerRaduisIfNeeded: 16, rotationDegreeIfNeeded: 8, onWillClose: {
        print("options:onWillClose!")
    }, onWillOpen: {
        print("options:onWillOpen!")
    }, onDidClose: {
        print("options:onDidClose!")
    }, onDidOpen: {
        print("options:onDidOpen!")
    })

    @Binding var selectedView: String
    var menuItems = [
        ["label": "Manage Boosts", "icon": "manage_boost"],
        ["label": "Manage Location", "icon": "manage_location"],
        ["label": "Reports", "icon": "reports"],
        ["label": "CheckIn Schedule", "icon": "checkin_schedule"],
        ["label": "Favorite Location", "icon": "favorite_location"],
        ["label": "Easter Eggs", "icon": "easter_eggs"],
        ["label": "Contact Us", "icon": "Contact_Us"]
    ]
    var body: some View {
        NavigationView{
            ZStack{
                    VStack(alignment: options.side.getHorizontalAlignment(), spacing: 20){
                        
                        HStack{
                            
                            ImageOnCircle(icon: "person.fill", radius: 30, circleColor: .red, imageColor: .white)
                            VStack(alignment: .leading,spacing: 0){
                                Text("Malik Shahnawaz").font(.body).bold().lineLimit(1)
                                Text("+92 348 4497585").font(.body).lineLimit(1)
                                Text("shahnawazazam733@gmail.com").font(.body).foregroundColor(Color.black).lineLimit(1).frame(maxWidth: UIScreen.screenWidth*0.4)
                            }
                            
                        }
                        
                        
                        ForEach(menuItems, id: \.self) {item in
                            Button {
                            } label: {
                                Side_Menu_Row_View(
                                    imageName: item["icon"]!,
                                    title:item["label"]!)
                                    .frame(maxWidth: .infinity, alignment: options.side.getAlignment())
                            }
                        }
                        Spacer()

                    }.padding(.horizontal,16)
                    .padding(.top, 32)
            }
            .toolbar(content: {
                ToolbarItem(placement: options.side.getToolbarItemPlacement(), content: {
                    if(options.show){
                        Button {
                            options.toggleMenu()
                        } label: {
                            Image(systemName: "xmark")
                        }
                        .foregroundColor(Color.primary)
                    }
                })
            }).id(UUID())
        }
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(selectedView: .constant("Home"))
    }
}
