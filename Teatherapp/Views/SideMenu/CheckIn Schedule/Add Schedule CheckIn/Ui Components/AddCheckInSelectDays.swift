//
//  AddCheckInSelectDays.swift
//  Teatherapp
//
//  Created by Hammad Khan on 30/09/2024.
//

import SwiftUI

struct AddCheckInSelectDays: View {
    @Binding var selectedWeekDays: Weekday
    var body: some View {
    
        
        VStack(alignment: .leading, spacing: 5){
        
            Text("Select Days:").font(.headline).fontWeight(.medium).padding(.top, 5.0)
            HStack{
                DayRadioButtonView(selectedWeekday: $selectedWeekDays, weekday: Weekday.monday).frame(maxWidth: .infinity)
                DayRadioButtonView(selectedWeekday: $selectedWeekDays, weekday: Weekday.tuesday).frame(maxWidth: .infinity)
                DayRadioButtonView(selectedWeekday: $selectedWeekDays, weekday: Weekday.wednesday).frame(maxWidth: .infinity)
                DayRadioButtonView(selectedWeekday: $selectedWeekDays, weekday: Weekday.thursday).frame(maxWidth: .infinity)
                DayRadioButtonView(selectedWeekday: $selectedWeekDays, weekday: Weekday.friday).frame(maxWidth: .infinity)
                DayRadioButtonView(selectedWeekday: $selectedWeekDays, weekday: Weekday.saturday).frame(maxWidth: .infinity)
                DayRadioButtonView(selectedWeekday: $selectedWeekDays, weekday: Weekday.sunday).frame(maxWidth: .infinity)
            }.padding(.horizontal).padding(.bottom)
            
        }.padding(.horizontal).background(.white)
        
    }
    
}

#Preview {
    AddCheckInSelectDays(selectedWeekDays: .constant(Weekday.monday))
}
