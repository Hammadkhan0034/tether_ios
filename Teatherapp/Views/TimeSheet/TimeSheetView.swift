//
//  TimeSheetView.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 26/12/2023.
//

import SwiftUI

struct TimeSheetView: View {

    @State var startDate = Date.now
    @State var endDate = Date.now
    
    var body: some View {
        VStack{
            HeaderBarView(title: "Timesheet")
            
            VStack{
                Text("Select Date")
                    .foregroundColor(Color.appBlue)
                    .bold()
                
                HStack{
                    Spacer()
                    
                    DatePicker(selection: $startDate,
                               in: ...Date.now,
                               displayedComponents: .date) {
//                                    Text("Start")
                                }
                               .labelsHidden()
                    
                    Spacer()
                    
                    DatePicker(selection: $endDate,
                               in: ...Date.now,
                               displayedComponents: .date) {
//                                    Text("End")
                                }
                               .labelsHidden()
                    Spacer()
                }
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    TimeSheetView()
}
