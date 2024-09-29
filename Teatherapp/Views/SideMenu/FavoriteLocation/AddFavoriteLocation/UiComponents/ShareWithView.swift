//
//  ShareWithView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 28/09/2024.
//

import SwiftUI

struct ShareWithView: View {
    @Binding var selectedOption: Int
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle().frame(width: .infinity, height: 50).foregroundColor(.gray.opacity(0.4))
            
            HStack{
                Text("Share with:").font(.headline).fontWeight(.semibold).foregroundColor(.checkinGray).padding(.leading)
                
                SimpleToggleButton(image: "snowflake", title: "Teams", isSelected: selectedOption==0, onclick: {
                    selectedOption = 0
                })
                SimpleToggleButton(image: "person.crop.circle", title: "Members", isSelected: selectedOption==1, onclick: {
                    selectedOption = 1
                })
                
            }
        }    }
}

#Preview {
    ShareWithView(selectedOption: .constant(0))
}
