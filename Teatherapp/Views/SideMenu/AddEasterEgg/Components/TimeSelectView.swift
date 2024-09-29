//
//  TimeSelectView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 28/09/2024.
//

import SwiftUI

struct TimeSelectView: View {
    
    @Binding var startTime: Date
    @Binding var endTime: Date
    
    
    
    var body: some View {
        HStack{
            Text("Start Time").font(.body).foregroundStyle(.textBluishBlack)
            Text(DateAndTimeUtils.formatDateToTimeString(date:  startTime)).foregroundColor(.gray).fontWeight(.semibold)
                .frame(width: 95 , height: 30)               .overlay(RoundedRectangle(cornerRadius: 30).stroke(.textBluishBlack, lineWidth: 1)).overlay{ //MARK: Place the DatePicker in the overlay extension
                    DatePicker(
                        "Start Time", selection: $startTime,
                        in: Date()..., displayedComponents: [.hourAndMinute]
                    )
                    .blendMode(.destinationOver) //MARK: use this extension to keep the clickable functionality
                }
            
            
            
            
            Text("End Time").font(.body).foregroundStyle(.textBluishBlack)
            Text(DateAndTimeUtils.formatDateToTimeString(date:  endTime)).foregroundColor(.gray).fontWeight(.semibold)
                .frame(width: 95 , height: 30)               .overlay(RoundedRectangle(cornerRadius: 30).stroke(.textBluishBlack, lineWidth: 1)).overlay{ //MARK: Place the DatePicker in the overlay extension
                    DatePicker(
                        "Start Time", selection: $endTime,
                        in: Date()..., displayedComponents: [.hourAndMinute]
                    )
                    .blendMode(.destinationOver) //MARK: use this extension to keep the clickable functionality
                }

        }    }
}

#Preview {
    TimeSelectView(startTime: .constant(Date.now), endTime: .constant(Date.now))
}
