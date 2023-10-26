//
//  CalendarView.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 21/10/2023.
//

import SwiftUI

struct CalendarView: View {

    @State private var selectedDate = Date.now
    
    var body: some View {
        VStack{
            HeaderBarView(title: "")
            
                DatePicker( "", selection: $selectedDate, displayedComponents: .date )
                    .datePickerStyle(.graphical)
                    .labelsHidden()
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CalendarView()
}
