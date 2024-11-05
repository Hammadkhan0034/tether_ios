//
//  DashboardMemberComponentView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 04/11/2024.
//

import SwiftUI

struct DashboardMemberComponentView: View {
    let dashboardMember: MemberDashboardModel
    var body: some View {
        VStack(spacing: 0){
            RemoteImageView(url: dashboardMember.userImage).frame(width: 35,height: 35).background(.blue).clipShape(.circle)
            Text(dashboardMember.name).font(.caption2).foregroundStyle(.appBlue).lineLimit(1)
        }.frame(width: 55, height: 60)
        
    }
}

#Preview {
    DashboardMemberComponentView(dashboardMember: MemberDashboardModel.sampleData1())
}
