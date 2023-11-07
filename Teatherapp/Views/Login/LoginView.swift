//
//  ContentView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 31/08/2023.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel =  LoginViewModel()
    @EnvironmentObject var userAuth : UserAuth
    @EnvironmentObject var locationManager: LocationManager
    
    @State var username = ""
    @State var password = ""
    @State var uuid = ""
    
    @State var isSecured: Bool = true
    
    @State var showingAlert = false
    @State var errorMessage = ""
    
    var body: some View {
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
            SimpleTextField(placeHolder: "Username", inputField: $username)
            
            //MARK: - Password TextField
            HStack{
                if isSecured {
                    SecurePasswordField(placeHolder: "Password", inputField: $password)
                }
                else {
                    PasswordTextField(placeHolder: "Password", inputField: $password)
                }
                
                Spacer()
                
                //MARK: - Eye Button
                Button(action: {
                    isSecured.toggle()
                }, label: {
                    Image(isSecured ? "closeEye" : "openEye")
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
                if !username.isEmpty && !password.isEmpty {
                    login()
                }
                else {
                    self.errorMessage = "All fields are mandatory."
                    self.showingAlert = true
                }
            }
            .padding(.top)
        }
        .padding()
        .navigationBarBackButtonHidden()
        .overlay(self.viewModel.isLoading ? LoadingView(): nil)
        
        .alert(self.errorMessage,
               isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
        .onAppear {
            self.uuid = UIDevice.current.identifierForVendor?.uuidString ?? ""
        }
        .onChange(of: viewModel.apiSuccessFullyCalled) { newValue in
            userAuth.login()
        }
    }
}

extension LoginView {
    func login () {
        viewModel.logIn(email: username,
                        password: password,
                        device_id: uuid,
                        device_type: "IOS")
    }
}
