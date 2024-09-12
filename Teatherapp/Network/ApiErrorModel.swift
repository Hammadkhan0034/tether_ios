//
//  ApiErrorModel.swift
//  Teatherapp
//
//  Created by Muhammad Hammad khan on 12-09-2024.
//

import Foundation
struct ApiErrorModel: Error{
    let status: String
    let errorType: ApError
    let message: String
}
