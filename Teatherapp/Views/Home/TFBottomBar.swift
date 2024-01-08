//
//  TFBottomBar.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 08/09/2023.
//

import SwiftUI

struct TFBottomBar: View {
    
    @EnvironmentObject var tfModel: TFBottomBarModel
    @ObservedObject var manager = LocationManager()
    
    var body: some View {
        
        VStack(spacing:0){
            Divider()
                .frame(height: 0.5)
                .background(.gray.opacity(0.05))
            
            HStack(alignment: .bottom){
                
                Spacer()
                
                VStack(spacing: 0){
                    Image(systemName: "square.grid.2x2.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                    Text("Dashboard")
                        .font(.caption)
                    
                }
                .foregroundColor(getColor(index: 1))
                .onTapGesture {tfModel.selectedIndex = 1}
                
                Spacer()
                
                if manager.locations.count < 2 {
                    NavigationLink {
                        HistoryView()
                    } label: {
                        VStack{
                            Image(systemName: "clock.arrow.circlepath")
                                .resizable()
                                .frame(width: 26, height: 23)
                                .offset(y: 3)
                            
                            Text("History")
                                .font(.caption)
                        }
                        .foregroundColor(getColor(index: 2))
                    }
                }
                else {
                    NavigationLink {
                        JobRequestView()
                    } label: {
                        VStack{
                            Image(systemName: "bubble.left.fill")
                                .resizable()
                                .frame(width: 26, height: 23)
                                .offset(y: 3)
                            
                            Text("Job Request")
                                .font(.caption)
                        }
                        .foregroundColor(getColor(index: 2))
                    }
                }
                
                Spacer()
                
                VStack{
                    Image(systemName: "mappin.and.ellipse")
                        .resizable()
                        .frame(width: 20, height: 24)
                        .offset(y: 3)
                    
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
                            .resizable()
                            .frame(width: 26, height: 22)
                            .offset(y: 3)
                        
                        Text("Calendar")
                            .font(.caption)
                    }
                    
                }
                .foregroundColor(getColor(index: 4))
                .onTapGesture {tfModel.selectedIndex = 4}
                
                Spacer()
                
                if manager.locations.count < 2 {
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
                }
                else {
                    NavigationLink {
                        TimeSheetView()
                    } label: {
                        VStack{
                            Image(systemName: "clock.fill")
                                .resizable()
                                .frame(width: 25, height: 23)
                                .offset(y: 3)
                            
                            Text("Timesheet")
                                .font(.caption)
                        }
                        .foregroundColor(getColor(index: 5))
                    }
                }
                
                Spacer()
            }
            .padding(.top, 10)
            .ignoresSafeArea()
            .background(.white)
        }
        .onAppear {
            tfModel.selectedIndex  = 1
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
