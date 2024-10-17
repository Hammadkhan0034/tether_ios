//
//  DashboardMapOverlay.swift
//  Teatherapp
//
//  Created by Hammad Khan on 15/10/2024.
//

import SwiftUI

struct DashboardMapOverlay: View {
    var body: some View {
        VStack{
            HStack{
                HomeAppBarView()
                HomeAppBarSideColumnView()
            }
        }
    }
}

#Preview {
    DashboardMapOverlay()
}
