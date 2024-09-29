//
//  BackgroundViewWrapper.swift
//  Teatherapp
//
//  Created by Hammad Khan on 28/09/2024.
//

import SwiftUI

struct BackgroundViewWrapper: View {
    let text: String
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle().frame(width: .infinity, height: 50).foregroundColor(.gray.opacity(0.4))
            Text(text).font(.title3).fontWeight(.semibold).foregroundColor(.checkinGray).padding(.leading)
        }    }
}

#Preview {
    BackgroundViewWrapper(text: "Location Details")
}
