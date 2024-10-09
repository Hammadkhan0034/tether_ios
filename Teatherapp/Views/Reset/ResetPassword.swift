//
//  ContentView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 31/08/2023.
//

import SwiftUI
import Alamofire

struct ResetPasswordView: View {
    
    @State var email = ""
    @State var isLoading = false
    @State var message = ""
    @State var showSnackBar = false
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

            TextField("Enter your email", text: $email).textFieldStyle(.roundedBorder).autocorrectionDisabled(true).textInputAutocapitalization(.never)
            TFButton(label: "Submit") {
                
                Task{
                    do{
                        let params: Parameters = ["email":email]
                        isLoading = true
                        let res: ApiResponseModel =  try await APIManager.shared.postAsync(endpoint: Endpoints.resetPassword, parameter: params)
                        isLoading = false
                        message = res.message
                        showSnackBar = true
                        print(res)
                    } catch(let error){
                        isLoading = false
                        print(error);
                        
                    }
                }
            }
            Spacer()
            
        }
        .padding(30) .overlay(isLoading ? LoadingView():nil).overlay(SimpleToastView(message: message, isShowing: $showSnackBar))
    }
}

#Preview {
    ResetPasswordView()
}
