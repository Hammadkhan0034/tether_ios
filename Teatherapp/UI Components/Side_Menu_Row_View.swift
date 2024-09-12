//
//  Side_Menu_Row_View.swift
//  Teatherapp
//
//  Created by Muhammad Hammad khan on 08-09-2024.
//

import SwiftUI

struct Side_Menu_Row_View: View {
    let imageName: String
    let title: String
    let textColor: Color
    var body: some View {
        HStack{
            Image(imageName).resizable().frame(width: 25,height: 25)
            Text(title).font(.title3).fontWeight(.semibold).foregroundStyle(textColor)
        }
    }
}

#Preview {
    Side_Menu_Row_View(imageName: "manage_boost", title: "Manage Boost",textColor: .appBlue)
}
