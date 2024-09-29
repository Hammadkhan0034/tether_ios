//
//  DownloadedReportsView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 29/09/2024.
//

import SwiftUI

struct DownloadedReportsView: View {
    var body: some View {
        NavigationView{
            VStack{
                AppBarView(title: "Reports")
                Spacer()
                Text("No Reports").font(.title2).foregroundStyle(.appBlue).fontWeight(.semibold)
                Spacer()
                
                   }.padding(.horizontal)
            
        }    }
}

#Preview {
    DownloadedReportsView()
}
