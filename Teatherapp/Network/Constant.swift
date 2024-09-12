//
//  Constant.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 13/11/2023.
//

import Foundation
import AVFoundation
import UIKit

class Constant {
    
    static var sharedInstance : Constant = Constant()
    let DEFAULTS = UserDefaults.standard
    
    var userId : Int {
        get {
            //return DEFAULTS.integer(forKey: "useId")
            return DEFAULTS.integer(forKey: "userId")
        }
    }
    
    var bearerToken : String? {
        get {
            return DEFAULTS.string(forKey: "authToken")
        }
    }
    static let REQUEST_TIMEOUT = "The request timed out."
    static let UNKNOWN_ERROR = "Unknown error occured while contacting the server."
    static let SPECIFY_LOCATION = "Please specify your location"
    static let NO_INTERNET = "No Network Available. Retry later"
    static let CONNECTED_INTERNET = "Network Available"
    static let INTERNAL_SERVER_ERROR = "Internal Server Error"
    static let SERVER_BUSY_ERROR = "Our computers seem to be under extreme stress serving great customers like you. We will resolve this as soon as possible. If this is urgent, please contact us at support@bankwithprofit.com"
}
