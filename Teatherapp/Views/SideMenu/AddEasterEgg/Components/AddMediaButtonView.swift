//
//  AddMediaButtonView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 27/09/2024.
//

import SwiftUI

struct AddMediaButtonView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10).foregroundStyle(.white).frame(width: 120,height: 120).shadow(radius: 5)
            Image(systemName: "plus").resizable().frame(width:70, height: 70).fontWeight(.semibold).foregroundStyle(.checkinGray)
            
                    }    }
}

#Preview {
    AddMediaButtonView()
}
