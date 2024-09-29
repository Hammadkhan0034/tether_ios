////
////  SimpleTextEditor.swift
////  Teatherapp
////
////  Created by Hammad Khan on 28/09/2024.
////
//
//import SwiftUI
//
//struct SimpleTextEditor: View {
//    @Binding var text: String
//    var body: some View {
//        TextEditor(text: $text).hi.padding(.leading)
//            .frame(height: 100)
//            .textInputAutocapitalization(.never)
//            .disableAutocorrection(true)
//            .autocorrectionDisabled()
//            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
//    
//    }
//}
//
//#Preview {
//    SimpleTextEditor(text: .constant("hello"))
//}
