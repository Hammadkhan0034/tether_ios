//
//  JobRequestView.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 26/12/2023.
//

import SwiftUI

struct JobRequestView: View {
    var body: some View {
        VStack{
            HeaderBarView(title: "Pending Request")
            
            Spacer()
            
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    JobRequestView()
}
