//
//  AddScheduleCheckInTeamMemberMustBe.swift
//  Teatherapp
//
//  Created by Hammad Khan on 30/09/2024.
//

import SwiftUI

struct AddScheduleCheckInTeamMemberMustBe: View {
    @Binding var isTeamMemberAvailable: Bool
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("Team Member Must Be").font(.headline).fontWeight(.medium).padding(EdgeInsets(top: 10, leading: 17, bottom: 0, trailing: 20))
            HStack{
                SelectAllRadioButton(title: "Available", isSelected: isTeamMemberAvailable, onClick: {
                    isTeamMemberAvailable.toggle()
                }, size: 20, font: .body)
                SelectAllRadioButton(title: "Checked-In", isSelected: !isTeamMemberAvailable, onClick: {
                    isTeamMemberAvailable.toggle()
                }, size: 20, font: .body)
                Spacer()
            }.padding(.leading).padding(.bottom)
        }.background(.white)
    }
}

#Preview {
    AddScheduleCheckInTeamMemberMustBe(isTeamMemberAvailable: .constant(false))
}

