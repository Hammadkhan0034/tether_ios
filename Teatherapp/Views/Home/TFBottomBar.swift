//
//  TFBottomBar.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 08/09/2023.
//

import SwiftUI

struct TFBottomBar: View {
    @EnvironmentObject var tfModel: TFBottomBarModel
    
    var body: some View {
        
        VStack(spacing:0){
            Divider()
                .frame(height: 0.5)
                .background(.gray.opacity(0.05))
            
            HStack(alignment: .bottom){
                
                Spacer()
                
                VStack(spacing: 0){
                    Image(systemName: "square.grid.2x2")
                        
                    Text("Dashboard")
                        .font(.caption)
                        
                }
                .foregroundColor(getColor(index: 1))
                .onTapGesture {tfModel.selectedIndex = 1}
                
                Spacer()
                
                NavigationLink {
                    HistoryView()
                } label: {
                    VStack{
                        Image(systemName: "clock.arrow.circlepath")
                        
                        Text("History")
                            .font(.caption)
                    }
                    .foregroundColor(getColor(index: 2))
                }
                
                Spacer()
                
                VStack{
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Check In")
                        .font(.caption)
                }
                .foregroundColor(getColor(index: 3))
                .onTapGesture {tfModel.selectedIndex = 3}

                Spacer()
                
                NavigationLink{
                    CalendarView()
                } label: {
                    VStack{
                        Image(systemName: "calendar")
                        
                        Text("Calendar")
                            .font(.caption)
                    }

                }
                .foregroundColor(getColor(index: 4))
                .onTapGesture {tfModel.selectedIndex = 4}
                
                Spacer()
                
                
                Button(action: {
                    if tfModel.selectedIndex == 5 {
                        tfModel.selectedIndex = 0
                    }
                    else {
                        tfModel.selectedIndex = 5
                    }
                }, label: {
                    Image(systemName: tfModel.selectedIndex == 5 ? "multiply" : "plus")
                        .foregroundStyle(Color.white)
                        .padding(25)
                        .background(Color.appBlue)
                        .clipShape(.circle)
                })

                Spacer()
            }
            .padding(.top,10)
            .ignoresSafeArea()
            .background(.white)
        }
    }
    
    func getColor(index:Int)->Color{
        if index == tfModel.selectedIndex{
            return .appBlue
        }
        return .gray
    }
}

//#Preview {
//    ZStack{
//        Color.black.ignoresSafeArea()
//        TFBottomBar(tfModel.selectedIndex:  1)
//    }
//}
