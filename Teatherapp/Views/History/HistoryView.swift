//
//  HistoryView.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 04/01/2024.
//

import SwiftUI

struct HistoryView: View {
    
    @State var currentBtn = 0
    @State var firstBtnName  = "Dispatch History"
    @State var secondBtnName = "Check In History"
    
    var body: some View {
        VStack{
            HeaderBarView(title: "History")
                .padding(.horizontal)
            
            UnderLineTabBarView(currentBtn: $currentBtn,
                                firstBtnName: $firstBtnName,
                                secondBtnName: $secondBtnName)
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HistoryView()
}
