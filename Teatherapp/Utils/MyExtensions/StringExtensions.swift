//
//  StringExtensions.swift
//  Teatherapp
//
//  Created by Hammad Khan on 18/10/2024.
//
import SwiftUI
extension String {
    var getValue: Any{
        return UserDefaults.standard.value(forKey: self) ?? ""
    }
}
