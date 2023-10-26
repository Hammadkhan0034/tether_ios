//
//  RootVIew.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 04/09/2023.
//

import SwiftUI

struct RootView: View {
    
    var tfModel = TFBottomBarModel()
    @State var isLoggedIn : Bool
    
    var body: some View {
        NavigationStack{
            if !isLoggedIn{
                LoginView(loginCallBack: onLoginPressed)
            }
            else {
                HomeView()
                    .environmentObject(tfModel)
            }
        }
    }
    
    func onLoginPressed(){
        print("true")
        isLoggedIn=true
    }
}

#Preview {
    RootView(isLoggedIn: false)
}
