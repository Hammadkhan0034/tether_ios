//
//  Services.swift
//  Teatherapp
//
//  Created by Muhammad Qayyum on 20/10/2023.
//

import Foundation

enum Endpoint : String {
    case login,
         signup
}

let ENV = "staging"
let base_URL = "https://tether.mydispatchapp.com"

class Services : NSObject {
    class func getEndpoint(_ endpoint : Endpoint) -> String {
        
        switch endpoint {
        case .login:
            return base_URL + "/V2/services/login"
        case .signup:
            return base_URL + "/V2/services/register"
        }
    }
}
