//
//  ContentView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 31/08/2023.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            
            Text(
                """
                 Hey,
                 Forgot Password.
                """)
                .font(.system(size: 32,weight: .heavy))
                .foregroundColor(.accentColor)
                .padding(.top,100)

            TextField("Enter your email", text: $username).textFieldStyle(.roundedBorder)
            TFButton(label: "Submit") {
                
            }
            Spacer()
            
        }
        .padding(30)
    }
}

#Preview {
    ResetPasswordView()
}
