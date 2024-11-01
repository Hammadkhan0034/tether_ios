//
//  DashboardEnvironment.swift
//  Teatherapp
//
//  Created by Hammad Khan on 30/10/2024.
//
import Foundation
import SwiftUICore
struct DashboardVMKey: EnvironmentKey {
    static var defaultValue = DashboardModelViewModel()
}

extension EnvironmentValues {
    var dashboardVM: DashboardModelViewModel {
        get { self[DashboardVMKey.self] }
        set { self[DashboardVMKey.self] = newValue }
    }
}
