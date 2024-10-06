//
//  LocationSharingView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 06/10/2024.
//

import SwiftUI

struct LocationSharingView: View {
    @State var isLocationSharing = false
    var body: some View {
        VStack{
        
            AppBarView(title: "Location Sharing").padding(.horizontal)
            VStack(alignment: .leading, spacing: 5){
                Text("Your location sharing").font(.body).padding(.top).padding(.leading)
                ZStack(alignment: .leading){
                    Rectangle().frame(width: .infinity, height: 90).foregroundColor(.white)
                    
                    Toggle(isOn: $isLocationSharing, label: {
                            HStack{
                                ImageOnCircle(icon: "person.fill", radius: 30, circleColor: .red, imageColor: .white)
                                Text("Malik Shahnawaz").font(.title2).fontWeight(.semibold )
                            }
                    }).padding(.horizontal)
                        
                    
                    
                }
                Text("Circle member status").font(.body).padding(.top).padding(.leading)
                ZStack(alignment: .center){
                    Rectangle().frame(width: .infinity, height: 100).foregroundColor(.white)
                    Text("No Member Found!").font(.title2)

                        
                    
                    
                }
                
                
                Spacer()
            }.background(Color.sky)
        }
    }
}

#Preview {
    LocationSharingView()
}
