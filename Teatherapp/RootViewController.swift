//
//  RootViewController.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 10/11/2023.
//

import SwiftUI

struct RootViewController: View {
    
    @EnvironmentObject var userAuth: UserAuth
    
    var body: some View {
        if !userAuth.isLoggedin {
            LoginView()
        }
        else {
            HomeView()
        }
    }
}

#Preview {
    RootViewController()
}
