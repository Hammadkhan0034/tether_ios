//
//  SOSView.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 30/10/2023.
//

import SwiftUI

struct SOSView: View {
    var body: some View {
        VStack{
            HeaderBarView(title: "SOS")
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SOSView()
}
