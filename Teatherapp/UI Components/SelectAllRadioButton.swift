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
    let size: Double
    let font: Font
    init(title: String, isSelected: Bool, onClick: @escaping () -> Void, size: Double = 30, font: Font = .title3) {
        self.title = title
        self.isSelected = isSelected
        self.onClick = onClick
        self.size = size
        self.font = font
    }
    
    var body: some View {
        Button(action: onClick) {
            HStack {
                Circle()
                    .stroke(.textBluishBlack, lineWidth: 2)
                    .frame(width: size, height: size)
                    .overlay(
                        Circle()
                            .fill(self.isSelected ? .textBluishBlack : Color.clear)
                            .frame(width: size * 0.6, height: size * 0.6)
                    )
                Text(title)
                    .foregroundColor(.textBluishBlack).font(font)
            }
            .padding(.horizontal)
        }
        .buttonStyle(PlainButtonStyle())
        }
}

#Preview {
    SelectAllRadioButton(title: "Select All", isSelected: true,onClick: {})
}
