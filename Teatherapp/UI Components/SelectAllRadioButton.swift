//
//  SelectAllRadioButton.swift
//  Teatherapp
//
//  Created by Hammad Khan on 27/09/2024.
//

import SwiftUI

struct SelectAllRadioButton: View {
    let title: String
    let isSelected: Bool
    let onClick: ()->Void
    var body: some View {
        Button(action: onClick) {
            HStack {
                Circle()
                    .stroke(.textBluishBlack, lineWidth: 2)
                    .frame(width: 30, height: 30)
                    .overlay(
                        Circle()
                            .fill(self.isSelected ? .textBluishBlack : Color.clear)
                            .frame(width: 18, height: 18)
                    )
                Text(title)
                    .foregroundColor(.textBluishBlack).font(.title3)
            }
            .padding(.horizontal)
        }
        .buttonStyle(PlainButtonStyle())
        }
}

#Preview {
    SelectAllRadioButton(title: "Select All", isSelected: true,onClick: {})
}
