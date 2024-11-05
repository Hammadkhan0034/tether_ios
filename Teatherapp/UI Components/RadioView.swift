//
//  RadioView.swift
//  Teatherapp
//
//  Created by Muhammad Hammad khan on 09-09-2024.
//

import SwiftUI

struct RadioView: View {
    let value: String
    let isSelected: Bool
    let onTap: () -> Void
    
    init(value: String, isSelected: Bool, onTap: @escaping () -> Void) {
        self.value = value
        self.isSelected = isSelected
        self.onTap = onTap
    }
    
    var body: some View {
        
            HStack {
                Circle()
                    .stroke(.textBluishBlack, lineWidth: 3)
                    .frame(width: 20, height: 20)
                    .overlay(
                        Circle()
                            .fill( isSelected ? .textBluishBlack : Color.clear)
                            .frame(width: 12, height: 12)
                    )
                Text(value)
                    .foregroundColor(.textBluishBlack).fontWeight(.semibold).font(.body)
                Spacer()
            }
            .padding(.horizontal)
        
    }
}


struct RadioViewFrequency: View {
    @Binding var selected: EasterEggFrequency
    let frequency: EasterEggFrequency
    
    
    var body: some View {
        Button(action: {
            self.selected = self.frequency
        }) {
            HStack {
                Circle()
                    .stroke(.textBluishBlack, lineWidth: 3)
                    .frame(width: 20, height: 20)
                    .overlay(
                        Circle()
                            .fill(self.selected == self.frequency ? .textBluishBlack : Color.clear)
                            .frame(width: 12, height: 12)
                    )
                Text(frequency.rawValue)
                    .foregroundColor(.textBluishBlack).font(.subheadline)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

//#Preview {
//    struct Preview: View {
//
//        @State var permissionLevel = PermissionLevels.fullAccess
//           var body: some View {
//               RadioView(value: "Limited Access", isSelected: true) {
//
//               }
//           }
//       }
//
//       return Preview()
//}




