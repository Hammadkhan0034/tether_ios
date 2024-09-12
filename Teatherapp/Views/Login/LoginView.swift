//
//  ContentView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 31/08/2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginViewModel =  LoginViewModel()
    @EnvironmentObject var userAuth : UserAuth

    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading,spacing: 20) {
                
                Text(
                """
                 Hey,
                 Login Now
                """)
                .font(.system(size: 32,weight: .heavy))
                .foregroundColor(Color.appBlue)
                
                HStack{
                    Text("If you are new?")
                    
                    NavigationLink(destination: {
                        SignupView()
                    }, label: {
                        Text("Sign Up")
                            .foregroundColor(Color.appBlue)
                            .fontWeight(.semibold)
                    })
                }
                //MARK: - UserName
                SimpleTextField(placeHolder: "Username", inputField: $loginViewModel.username)
                
                //MARK: - Password TextField
                HStack{
                    if loginViewModel.isSecured {
                        SecurePasswordField(placeHolder: "Password", inputField: $loginViewModel.password)
                    }
                    else {
                        PasswordTextField(placeHolder: "Password", inputField: $loginViewModel.password)
                    }
                    
                    Spacer()
                    
                    //MARK: - Eye Button
                    Button(action: {
                        loginViewModel.isSecured.toggle()
                    }, label: {
                        Image(loginViewModel.isSecured ? "closeEye" : "openEye")
                    })
                    .padding(.trailing, 10)
                }
                .frame(height: 50)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.top)
                
                HStack{
                    Text("Forgot password?")
                    
                    NavigationLink(destination: {
                        ResetPasswordView()
                    }, label: {
                        Text("Reset")
                            .foregroundColor(Color.appBlue)
                            .fontWeight(.semibold)
                    })
                }
                
                TFButton(label: "Login") {
                    loginViewModel.logIn()
                }
                .padding(.top)
            }
            .padding()
            .navigationBarBackButtonHidden()
            .overlay(self.loginViewModel.isLoading ? LoadingView(): nil)
            .alert(isPresented: $loginViewModel.showingAlert, content: {
                return AlertContext.makeAlert(title: "Login Error", message: loginViewModel.errorString, onTap: {
                    self.loginViewModel.showingAlert = false
                })
            }).onChange(of: loginViewModel.apiSuccessFullyCalled){newValue in
                userAuth.login()
            }

            
        }
    }
}

