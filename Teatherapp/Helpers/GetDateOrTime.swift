//
//  GetDateOrTime.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 10/11/2023.
//

import Foundation

//MARK: - get Time
func getTime(dateString: String) -> String {
    
    let dateFormatter = DateFormatter()
//    dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
    dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
    let DBDate = dateFormatter.date(from: dateString)!
    
    // this format to 24 hour
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter.string(from: DBDate)
}

//MARK: - get Date
func getDate(dateString: String) -> String {
    
    let dateFormatter = DateFormatter()
//    dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
    dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
    let DBDate = dateFormatter.date(from: dateString)!
    
//    dateFormatter.dateStyle = .long // "16 February 2023"
    dateFormatter.dateStyle = .medium  // "16 Feb 2023"
    
    return dateFormatter.string(from: DBDate)
}
