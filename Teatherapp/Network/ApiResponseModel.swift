//
//  ApiResponseModel.swift
//  Teatherapp
//
//  Created by Muhammad Hammad khan on 12-09-2024.
//

import Foundation

struct ApiResponseModel{
    let status:String
    let message: String
    let data: [String:Any]?
    
    init(status: String, message: String, data: [String: Any]? = nil) {
        self.status = status
        self.message = message
        self.data = data
    }
}
