//
//  ReportTypeView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 28/09/2024.
//

import SwiftUI

struct ReportTypeView: View {
    let title: String
    let onClick: ()->Void
    
    var body: some View {
        
        Button(action: onClick, label: {
            HStack{
                Image("report_icon").resizable().frame(width: 50,height: 50).padding(.leading)
                Text(title).foregroundStyle(.appBlue).fontWeight(.semibold).font(.title3)
                Spacer()
            }.frame(width: .infinity,height: 70).background(.backIconbackground).cornerRadius(radius: 10, corners: .allCorners).shadow(radius: 1)
        
        }).padding(.bottom)
        
        }
}

#Preview {
    ReportTypeView(title: "Dispatch Report", onClick: {})
}
