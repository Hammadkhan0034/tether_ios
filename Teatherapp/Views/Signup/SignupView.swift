//
//  SignupView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 05/09/2023.
//

import SwiftUI

struct SignupView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel =  SignupViewModel()
    
    @State var fname = ""
    @State var lname = ""
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var phoneCode = ""
    @State var phoneNumber = ""
    @State var address = ""
    @State var city = ""
    @State var state = ""
    @State var zipCode = ""
    
    @State var timeZone = "Asia"
    @State var uuid = ""
    
    @State var isSecured: Bool = true
    
    @State var showingAlert = false
    @State var errorMessage = ""
    
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
                        SimpleTextField(placeHolder: "First Name", inputField: $fname)
                        
                        SimpleTextField(placeHolder: "Last Name", inputField: $lname)
                    }
                    
                    //MARK: - User Name
                    SimpleTextField(placeHolder: "Username", inputField: $username)
                    
                    //MARK: - Email
                    SimpleTextField(placeHolder: "Email", inputField: $email)
                    
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
                    
                    HStack(spacing: 20){
                        CountryPicker(phoneCode: $phoneCode, foregroundColor: Color.appBlue)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                        
                        SimpleTextField(placeHolder: "Phone Number", inputField: $phoneNumber)
                    }
                    
                    //MARK: - Address
                    HStack{
                        TextField("Address", text: $address)
                            .padding(.leading)
                            .frame(height: 50)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .autocorrectionDisabled()
                            
                        Spacer()
                        
                        if address.count > 0 {
                            Button(action: {
                                address = ""
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
                    SimpleTextField(placeHolder: "City", inputField: $city)
                    
                    //MARK: - State
                    SimpleTextField(placeHolder: "State", inputField: $state)
                    
                    //MARK: - Zip Code
                    SimpleTextField(placeHolder: "Zip Code", inputField: $zipCode)
                    
                    TFButton(label: "Signup") {
                        if !fname.isEmpty && !lname.isEmpty && !email.isEmpty && !username.isEmpty && !password.isEmpty && !phoneCode.isEmpty && !phoneNumber.isEmpty && !address.isEmpty && !timeZone.isEmpty {
                            signUpAPICalled()
                        }
                        else {
                            self.errorMessage = "All fields are mandatory."
                            self.showingAlert = true
                        }
                    }
                }
            }
        }
        .alert(self.errorMessage,
               isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
        .padding()
        .navigationBarBackButtonHidden()
        .overlay(self.viewModel.isLoading ? LoadingView(): nil)
        .onAppear{
            self.uuid = UIDevice.current.identifierForVendor?.uuidString ?? ""
        }
        .onChange(of: viewModel.apiSuccessFullyCalled) { newValue in
                dismiss()
        }
    }
}

//#Preview {
//    SignupView()
//}

extension SignupView {
    
    func signUpAPICalled() {
        viewModel.signUp(name: "\(self.fname + self.lname)",
                         email: self.email,
                         username: self.username,
                         password: self.password,
                         phoneCode: self.phoneCode,
                         phoneNumber: self.phoneNumber,
                         address: self.address,
                         deviceType: "IOS",
                         timeZone: self.timeZone,
                         deviceID: self.uuid)
    }
}
