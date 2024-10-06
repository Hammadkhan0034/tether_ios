//
//  MenuView.swift
//  NSideMenuApp
//
//  Created by Najim on 12/2/21.
//

import SwiftUI
import NSideMenu

struct SideMenuView: View {
        @EnvironmentObject var options: NSideMenuOptions
    @EnvironmentObject var userAuth : UserAuth
    
//    @StateObject var options = NSideMenuOptions(style: .scale, side: .leading, width: 220, showSkeletonStack: false, skeletonStackColor: .white, cornerRaduisIfNeeded: 16, rotationDegreeIfNeeded: 8, onWillClose: {
//        print("options:onWillClose!")
//    }, onWillOpen: {
//        print("options:onWillOpen!")
//    }, onDidClose: {
//        print("options:onDidClose!")
//    }, onDidOpen: {
//        print("options:onDidOpen!")
//    })
    
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
                    
                    
                    
                    NavigationLink(destination: {
                        ManageBoostView().navigationBarBackButtonHidden(true)
                    }, label: {
                        
                        Side_Menu_Row_View(
                            imageName: menuItems[0]["icon"]!,
                            title:menuItems[0]["label"]!,textColor: .appBlue)
                        .frame(maxWidth: .infinity, alignment: options.side.getAlignment())
                    })
                    
                    NavigationLink(destination: {
                        ManageLocationView().navigationBarBackButtonHidden(true)
                    }, label: {
                        
                        Side_Menu_Row_View(
                            imageName: menuItems[1]["icon"]!,
                            title:menuItems[1]["label"]!,textColor: .appBlue)
                        .frame(maxWidth: .infinity, alignment: options.side.getAlignment())
                    })
                    
                    NavigationLink(destination: {
                        ReportMainView().navigationBarBackButtonHidden(true)
                    }, label: {
                        
                        Side_Menu_Row_View(
                            imageName: menuItems[2]["icon"]!,
                            title:menuItems[2]["label"]!,textColor: .appBlue)
                        .frame(maxWidth: .infinity, alignment: options.side.getAlignment())
                    })
                    
                    NavigationLink(destination: {
                        CheckInScheduleView().navigationBarBackButtonHidden(true)
                    }, label: {
                        
                        Side_Menu_Row_View(
                            imageName: menuItems[3]["icon"]!,
                            title:menuItems[3]["label"]!,textColor: .appBlue)
                        .frame(maxWidth: .infinity, alignment: options.side.getAlignment())
                    })
                    
                    NavigationLink(destination: {
                        FavoriteLocationsView().navigationBarBackButtonHidden(true)
                    }, label: {
                        
                        Side_Menu_Row_View(
                            imageName: menuItems[4]["icon"]!,
                            title:menuItems[4]["label"]!,textColor: .appBlue)
                        .frame(maxWidth: .infinity, alignment: options.side.getAlignment())
                    })
                    
                    NavigationLink(destination: {
                        EasterEggsView().navigationBarBackButtonHidden(true)
                    }, label: {
                        
                        Side_Menu_Row_View(
                            imageName: menuItems[5]["icon"]!,
                            title:menuItems[5]["label"]!,textColor: .appBlue)
                        .frame(maxWidth: .infinity, alignment: options.side.getAlignment())
                    })
                    
                    NavigationLink(destination: {
                        ContactUsView().navigationBarBackButtonHidden(true)
                    }, label: {
                        
                        Side_Menu_Row_View(
                            imageName: menuItems[6]["icon"]!,
                            title:menuItems[6]["label"]!,textColor: .appBlue)
                        .frame(maxWidth: .infinity, alignment: options.side.getAlignment())
                    })
                    
                    Spacer()
                    
                    Side_Menu_Row_View(
                        imageName: "logout",
                        title:"Logout",textColor: .red)
                    .frame(maxWidth: .infinity, alignment: options.side.getAlignment()).onTapGesture {
                        UserDefaults.standard.setValue(false, forKey: "loggedIn")
                        userAuth.logout()
                    }
                    
                    
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
        SideMenuView(selectedView: .constant("Home"))
    }
}
