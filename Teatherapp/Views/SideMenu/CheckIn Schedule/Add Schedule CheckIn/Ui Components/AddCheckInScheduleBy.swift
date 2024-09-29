//
//  AddCheckInScheduleBy.swift
//  Teatherapp
//
//  Created by Hammad Khan on 29/09/2024.
//

import SwiftUI

struct AddCheckInScheduleBy: View {
    @Binding var scheduledBy: Int
    var body: some View {
        
        VStack(alignment: .leading,spacing: 7){
            HStack{
                
                Text("Schedule By:").font(.headline).fontWeight(.medium).padding(EdgeInsets(top: 10, leading: 17, bottom: 0, trailing: 20))
                Spacer()
            }
            HStack{
                VStack{
                    SimpleToggleButton(image: "snowflake", title: "Teams", isSelected: scheduledBy==0, onclick: {
                        scheduledBy = 0
                    },width: 150)
                
                    
                    Text("0 Location Selected").font(.caption)
                }.padding(.trailing)
                VStack{
                    SimpleToggleButton(image: "person.crop.circle", title: "Members", isSelected: scheduledBy==1, onclick: {
                        scheduledBy = 1
                    }, width: 150)
                    Text("0 Member Selected").font(.caption)

                }
            }.padding(.horizontal).padding(.bottom)
            
            
          
        }.background(.white)
    }
}

#Preview {
    AddCheckInScheduleBy(scheduledBy: .constant(0))
}
