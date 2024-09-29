//
//  ContactUsView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 27/09/2024.
//

import SwiftUI

struct ContactUsView: View {
    @StateObject var viewModel = ContactUsViewModel()
    var body: some View {
        VStack(){
            AppBarView(title: "Contact Us").padding(.horizontal)
            Spacer().frame(height: 70)
            SimpleTextField(placeHolder: "Name", inputField: $viewModel.name)
            SimpleTextField(placeHolder: "Email", inputField: $viewModel.email).padding(.top)
            PhoneNumberView().frame(height: 50).padding(.top)
            SimpleTextField(placeHolder: "Comments", inputField: $viewModel.comments).padding(.top)
            
            TFButton(label: "Send", onClick: {},width: 200).padding(.top)
            Spacer()
            
        }.padding(.horizontal)    }
}

#Preview {
    ContactUsView()
}

