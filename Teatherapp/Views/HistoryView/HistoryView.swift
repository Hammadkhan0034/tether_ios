//
//  JobRequests.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 07/09/2023.
//

import SwiftUI

struct HistoryView: View {
    
    @State var selectedTab : Int = 0
    
    @State var firstBtnName : String = "Dispatch History"
    @State var secondBtnName : String = "Check In History"
    
    var body: some View {
        VStack {
            HeaderBarView(title: "History")
            
            UnderLineTabBarView(currentBtn: self.$selectedTab, firstBtnName: self.$firstBtnName, secondBtnName: self.$secondBtnName)
                .padding(.bottom)
            
            if selectedTab == 0 {
                DispatchHistoryView()
            }
            else {
                CheckInHistoryView()
            }
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HistoryView()
}


//.tabItem {
//    Image(systemName: "message.fill")
//    Text("Job Requests")
//}
