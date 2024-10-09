//
//  Services.swift
//  Teatherapp
//
//  Created by Muhammad Qayyum on 20/10/2023.
//

import Foundation
import Alamofire

struct Endpoints{
    
    static let resetPassword = "forgot-password"
}

enum Endpoint : String {
    case login,
         signup,
         getUserDetails,
         getConversation,
         getChat,
         saveChat,
         getUsersLocation
}

let ENV = "staging"
let base_URL = "https://tether.mydispatchapp.com/V2/services/"
//let Header : HTTPHeaders = ["Content-Type": "application/json",
//                                      "API_KEY":"9185042346",
//                                      "Ocp-Apim-Subscription-Key":"efac157530e540059a2d54678e56bcf6" ]

class Services : NSObject {
    class func Endpoint(_ endpoint : Endpoint) -> String {
        
        switch endpoint {
        case .login:
            return "login"
        case .signup:
            return "register"
        case .getUserDetails:
            return base_URL + "get-user-details"
        case .getConversation:
            return base_URL + "get-conversations"
        case .getChat:
            return base_URL + "get-chat"
        case .saveChat:
            return base_URL + "save-chat"
        case .getUsersLocation:
            return base_URL + "get-user-dashboard"
        }
    }
}
