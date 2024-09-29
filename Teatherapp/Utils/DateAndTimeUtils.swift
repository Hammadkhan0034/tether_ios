//
//  DateAndTimeUtils.swift
//  Teatherapp
//
//  Created by Hammad Khan on 28/09/2024.
//
import Foundation
class DateAndTimeUtils{
    
    static func formatDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: date)
    }
    static func formatDateToTimeString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
    }


}
