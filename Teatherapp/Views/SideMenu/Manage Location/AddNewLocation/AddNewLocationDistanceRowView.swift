//
//  AddNewLocationDistanceRowView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 20/10/2024.
//

import SwiftUI

struct AddNewLocationDistanceRowView: View {
    @Binding var isFeetSelected: Bool
    @Binding var distance: Double
    var body: some View {
        VStack{
            HStack{
                
                HStack{
                    SimpleToggleTextButton(title: "Feet", isSelected: isFeetSelected,onclick:  {
                        if(isFeetSelected) {return}
                        distance = 250
                        isFeetSelected = true
                    }, width:UIScreen.screenWidth * 0.25)
                    SimpleToggleTextButton(title: "Miles", isSelected: !isFeetSelected,onclick:  {
                        if(!isFeetSelected){return}
                        distance = 1
                        isFeetSelected = false
                    }, width:UIScreen.screenWidth * 0.25)
                }.padding(.all,2).overlay {
                    RoundedRectangle(cornerRadius: 5).stroke(.appBlue,lineWidth: 1)
                }
                Spacer()
                Text(String(format:"%.02f",distance)).foregroundStyle(.textBluishBlack).frame(width:UIScreen.screenWidth * 0.25,height: 45).overlay {
                    RoundedRectangle(cornerRadius: 5).stroke(.appBlue,lineWidth: 1)
                }
                Text(isFeetSelected ? "Ft" : "Miles").foregroundStyle(.appBlue)
            }
            Slider(value: $distance, in: isFeetSelected ? 250...5280 : 1...10)
        }
    }
}

#Preview {
    AddNewLocationDistanceRowView(isFeetSelected: .constant(true), distance: .constant(250))
}
