//
//  MyExtensions.swift
//  Teatherapp
//
//  Created by Muhammad Hammad khan on 08-09-2024.
//

import Foundation
import SwiftUI

// MARK: height and width extension on UIScreen
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

extension String {
    var isValidEmail: Bool{
        let emailFormat = "^[a-zA-Z0-9._%±]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    var initials: String {
            let components = self.split(separator: " ")
            guard !components.isEmpty else { return "" }
            let initials = components.prefix(2).compactMap { $0.first }.map { String($0) }
            return initials.joined().uppercased() // Optionally uppercased
        }
}
