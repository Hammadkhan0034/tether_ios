//
//  HomeAppBarSideColumnView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 15/10/2024.
//

import SwiftUI

struct HomeAppBarSideColumnView: View {
    @State var showFilters:Bool = true
    var body: some View {
        VStack(alignment:.trailing){
            
            
            //MARK: - Notification
            NavigationLink{
                NotificationView()
            }label:{
                
                    ImageOnCircle(icon: "bell.and.waves.left.and.right.fill", radius: 18, circleColor: .white, imageColor: .appBlue,shadowRadius:1)
            }
            //MARK: - Setting
            NavigationLink{
                SettingView(isAvailable: true).navigationBarBackButtonHidden(true)
            }label:{
                
                    ImageOnCircle(icon: "gearshape.fill", radius: 18, circleColor: .white, imageColor: .appBlue,shadowRadius:1)
            }
            
            Button{
                showFilters = !showFilters
            }label:{
                if showFilters {   ImageOnCircle(icon: "xmark", radius: 18, circleColor: .white, imageColor: .appBlue,shadowRadius:1) }
                
                else {Image("filter_icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .padding(.all,5)
                        .background(Color.white)
                    .clipShape(.circle).shadow(radius: 1)}
                
            }
            if showFilters{
                VStack(alignment:.trailing){
                        Toggle(isOn: .constant(true)) {
                            Text("Team Members")
                                .foregroundStyle(.red)
                                .font(.system(size: 16,weight: Font.Weight.medium))
                        }
                        .toggleStyle(iOSCheckboxToggleStyle())
                    
                        Toggle(isOn: .constant(true)) {
                            Text("Favorite Location")
                                .foregroundStyle(.red)
                                .font(.system(size: 16,weight: Font.Weight.medium))
                        }
                        .toggleStyle(iOSCheckboxToggleStyle())
                    
                        Toggle(isOn: .constant(true)) {
                            Text("Job/Task")
                                .foregroundStyle(.red)
                                .font(.system(size: 16,weight: Font.Weight.medium))
                        }
                        .toggleStyle(iOSCheckboxToggleStyle())
                    
                }.animation(.bouncy, value: showFilters)
            }
        }
        .foregroundColor(Color.appBlue).padding(.horizontal)    }
}

#Preview {
    HomeAppBarSideColumnView()
}
