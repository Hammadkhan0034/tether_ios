//
//  UserAuth.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 02/11/2023.
//

import Foundation
import Combine

class UserAuth: ObservableObject {
    
    @Published var isLoggedin = false

    func login() {
        // login request... on success:
        self.isLoggedin = true
    }

    func logout() {
        // logout request... on success:
        self.isLoggedin = false
    }
}
