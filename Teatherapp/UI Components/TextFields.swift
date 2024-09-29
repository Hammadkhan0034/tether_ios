//
//  TextFields.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 19/10/2023.
//

import SwiftUI

struct SimpleTextField: View {
    
    @State var placeHolder: String
    @Binding var inputField : String
    let lineLimit: Int
    let height : Double
    let width : Double
    let radius : Double
    init(placeHolder: String, inputField: Binding<String>, lineLimit: Int = 1, height: Double = 50, width: Double = .infinity, radius: Double = 8) {
        self.placeHolder = placeHolder
        self._inputField = inputField
        self.lineLimit = lineLimit
        self.height = height
        self.width = width
        self.radius = 8
    }
    var body: some View {
            TextField("", text: $inputField, prompt: Text(placeHolder).foregroundColor(.gray).fontWeight(.semibold)).lineLimit(1...3)
                .padding(.leading)
                .frame(width: width,height: height)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .autocorrectionDisabled().background(.white)
                .overlay(RoundedRectangle(cornerRadius: radius).stroke(Color.gray, lineWidth: 1)).cornerRadius(radius: radius, corners: .allCorners)
        
    }
}

struct PasswordTextField: View {
    
    @State var placeHolder: String
    @Binding var inputField : String
    
    var body: some View {
        VStack{
            TextField(placeHolder, text: $inputField)
                .padding(.leading)
                .frame(height: 50)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .autocorrectionDisabled()
        }
    }
}

struct SecurePasswordField: View {
    
    @State var placeHolder: String
    @Binding var inputField : String
    
    var body: some View {
        VStack{
            SecureField(placeHolder, text: $inputField)
                .padding(.leading)
                .frame(height: 50)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .autocorrectionDisabled()
        }
    }
}
