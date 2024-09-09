//
//  RadioView.swift
//  Teatherapp
//
//  Created by Muhammad Hammad khan on 09-09-2024.
//

import SwiftUI

struct RadioView: View {
    @Binding var selected: PermissionLevels
    let permissionLevel: PermissionLevels
    
    
    var body: some View {
        Button(action: {
            self.selected = self.permissionLevel
        }) {
            HStack {
                Circle()
                    .stroke(.textBluishBlack, lineWidth: 3)
                    .frame(width: 20, height: 20)
                    .overlay(
                        Circle()
                            .fill(self.selected == self.permissionLevel ? .textBluishBlack : Color.clear)
                            .frame(width: 12, height: 12)
                    )
                Text(permissionLevel.rawValue)
                    .foregroundColor(.textBluishBlack).fontWeight(.semibold).font(.title2)
            }
            .padding(.horizontal)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    struct Preview: View {
        
        @State var permissionLevel = PermissionLevels.fullAccess
           var body: some View {
               RadioView(selected: $permissionLevel, permissionLevel: PermissionLevels.fullAccess)
           }
       }

       return Preview()
}
