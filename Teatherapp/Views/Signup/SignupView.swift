//
//  SignupView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 05/09/2023.
//

import SwiftUI

struct SignupView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel =  SignupViewModel()
    
    var body: some View {
        VStack{
            HStack{
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image("back_arrow_icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding()
                        .background(Color.appBlue.opacity(0.1))
                        .clipShape(.circle)
                }
            }
            
            //MARK: - Body Start
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading,spacing: 20) {
                    Text(
                        """
                         Hey,
                         Signup Now.
                        """)
                    .font(.system(size: 32,weight: .heavy))
                    .foregroundColor(.accentColor)
                    .padding(.top)
                    
                    HStack(spacing: 20){
                        SimpleTextField(placeHolder: "First Name", inputField: $viewModel.fname)
                        
                        SimpleTextField(placeHolder: "Last Name", inputField: $viewModel.lname)
                    }
                    
                    //MARK: - User Name
                    SimpleTextField(placeHolder: "Username", inputField: $viewModel.username)
                    
                    //MARK: - Email
                    SimpleTextField(placeHolder: "Email", inputField: $viewModel.email)
                    
                    //MARK: - Password TextField
                    HStack{
                        if viewModel.isSecured {
                            SecurePasswordField(placeHolder: "Password", inputField: $viewModel.password)
                        }
                        else {
                            PasswordTextField(placeHolder: "Password", inputField: $viewModel.password)
                        }
                        
                        Spacer()
                        
                        //MARK: - Eye Button
                        Button(action: {
                            viewModel.isSecured.toggle()
                        }, label: {
                            Image(viewModel.isSecured ? "closeEye" : "openEye")
                        })
                        .padding(.trailing, 10)
                    }
                    .frame(height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    
                    HStack(spacing: 20){
                        CountryPicker(phoneCode: $viewModel.phoneCode, foregroundColor: Color.appBlue)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                        
                        SimpleTextField(placeHolder: "Phone Number", inputField: $viewModel.phoneNumber)
                    }
                    
                    //MARK: - Address
                    HStack{
                        TextField("Address", text: $viewModel.address)
                            .padding(.leading)
                            .frame(height: 50)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .autocorrectionDisabled()
                            
                        Spacer()
                        
                        if viewModel.address.count > 0 {
                            Button(action: {
                                viewModel.address = ""
                            }, label: {
                                Image(systemName: "multiply.circle.fill")
                            })
                            .padding(.horizontal, 8)
                        }
                        else {
                            Image("Manage_Locations")
                                .padding(.horizontal, 8)
                        }
                    }
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    

                    
                    //MARK: - City
                    SimpleTextField(placeHolder: "City", inputField: $viewModel.city)
                    
                    //MARK: - State
                    SimpleTextField(placeHolder: "State", inputField: $viewModel.state)
                    
                    //MARK: - Zip Code
                    SimpleTextField(placeHolder: "Zip Code", inputField: $viewModel.zipCode)
                    
                    TFButton(label: "Signup", onClick: viewModel.signUp)
                }
            }
        }
        .alert(isPresented: $viewModel.showingAlert, content: {
            return AlertContext.makeAlert(title: "Signup Error", message: viewModel.errorString, onTap: {
                self.viewModel.showingAlert = false
            })
        })
        .padding()
        .navigationBarBackButtonHidden()
        .overlay(self.viewModel.isLoading ? LoadingView(): nil)
        .onChange(of: viewModel.apiSuccessFullyCalled) { newValue in
                dismiss()
        }
    }
}

//#Preview {
//    SignupView()
//}

