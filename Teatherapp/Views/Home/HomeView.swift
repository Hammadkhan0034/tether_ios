//
//  HomeView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 04/09/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var tfModel: TFBottomBarModel
    
    var body: some View {
        DashboardMap()
            .environmentObject(tfModel)
        
        TFBottomBar()
            .environmentObject(tfModel)
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
