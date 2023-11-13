//
//  TimeInterval.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 07/11/2023.
//

import Foundation

//MARK: - Menage the note time
func timeInterval(dateString: String) -> String {
    
    let inputDate = DateFormatter()
//    2023-11-06 15:21:11
    inputDate.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
    inputDate.timeZone = NSTimeZone(name: "UTC") as TimeZone?
//    inputDate.timeZone = NSTimeZone(name: "Europe/London") as TimeZone?
    let DBDate = inputDate.date(from: dateString)
    
    //LocalTime
    inputDate.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SS"
    inputDate.timeZone = TimeZone.current
    let localDate = inputDate.string(from: DBDate!)
    
    //OutPut
    let outputDate = DateFormatter()
    outputDate.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SS"
    let convertedDate = outputDate.date(from: localDate)
    
    let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: convertedDate!, to: Date())
    
    if let year = interval.year, year > 0 {
        return year == 1 ? "\(year)" + " " + "year ago" : "\(year)" + " " + "years ago"
    }
    else if let month = interval.month, month > 0 {
        return month == 1 ? "\(month)" + " " + "month ago" : "\(month)" + " " + "months ago"
    }
    else if let day = interval.day, day > 0 {
        return day == 1 ? "\(day)" + " " + "day ago" : "\(day)" + " " + "days ago"
    }
    else if let hour = interval.hour, hour > 0 {
        return hour == 1 ? "\(hour)" + " " + "hour ago" : "\(hour)" + " " + "hours ago"
    }
    else if let minute = interval.minute, minute > 0 {
        return minute == 1 ? "\(minute)" + " " + "minute ago" : "\(minute)" + " " + "minutes ago"
    }
    else {
        return "Just Now"
    }
}
