//
//  BottomRoundedBackgroundRectangle.swift
//  Teatherapp
//
//  Created by Hammad Khan on 27/09/2024.
//

import SwiftUI

struct BottomRoundedBackgroundRectangle: View {
    var body: some View {
        VStack {
            Rectangle().foregroundStyle(.appBlue).frame(height: 400).cornerRadius(radius: UIScreen.main.bounds.size.width, corners:[.bottomLeft,.bottomRight]
            )
            Spacer()
        }.ignoresSafeArea()
        }
}

#Preview {
    BottomRoundedBackgroundRectangle()
}
