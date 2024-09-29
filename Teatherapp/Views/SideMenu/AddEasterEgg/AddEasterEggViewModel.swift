//
//  AddEasterEggViewModel.swift
//  Teatherapp
//
//  Created by Hammad Khan on 27/09/2024.
//
import Foundation

class AddEasterEggViewModel : ObservableObject{
    @Published var easterEggType = "Specific Day Of The Week"
    @Published var title: String = ""
    @Published var address: String = ""
    
    @Published var frequency: EasterEggFrequency = EasterEggFrequency.oneTime
    @Published var note: String = ""
    @Published var url: String = ""
    @Published var selectedSpecificDay: Date = Date()
    @Published var selectedTimeDay: Date = Date()
    @Published var selectedPeriodStartTime: Date = Date()
    @Published var selectedPeriodEndTime: Date = Date()
    @Published var isAllSelected: Bool = false
    @Published var selectedWeekDay: Weekday = Weekday.monday


    @Published var selectedSpecificDayString = "Select Date"
    @Published var selectedSpecificTimeString = "Select Time"
    
    
}
