//
//  ManageLocationView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 30/09/2024.
//

import SwiftUI

struct ManageLocationView: View {
    var body: some View {
        
            NavigationView{
                VStack{
                    AppBarView(title: "Locations").padding(.horizontal)
                    
                    HStack{
                        Image(systemName: "plus.circle.fill").resizable().frame(width: 50,height: 50).foregroundStyle(.appBlue)
                        Text("Add a new Location").font(.title3).bold().foregroundStyle(.appBlue).padding(.leading)
                        Spacer()
                    }.padding(.horizontal)
                    Rectangle().foregroundStyle(.gray).frame(height: 1)

                    Spacer()
                    VStack{
                        
                        Image(systemName: "text.page.badge.magnifyingglass").resizable().frame(width: 40,height: 50).foregroundStyle(.appBlue)
                        Text("Unable to get location data").font(.headline)
                        Text("Please add a new location").font(.caption)
                    }
                    Spacer()
                    
                }
                
            }    }
}

#Preview {
    ManageLocationView()
}
