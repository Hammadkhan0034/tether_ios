//
//  ContactUsViewModel.swift
//  Teatherapp
//
//  Created by Hammad Khan on 27/09/2024.
//
import Foundation
import SwiftUI
class ContactUsViewModel: ObservableObject{
    
    @Published var name : String = ""
    @Published var email : String = ""
    @Published var phoneCode : String = ""
    @Published var number : String = ""
    @Published var comments : String = ""
}
