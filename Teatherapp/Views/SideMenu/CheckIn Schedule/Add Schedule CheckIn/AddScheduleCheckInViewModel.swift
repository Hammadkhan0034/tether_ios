//
//  AddScheduleCheckInViewModel.swift
//  Teatherapp
//
//  Created by Hammad Khan on 29/09/2024.
//

import Foundation
class AddScheduleCheckInViewModel: ObservableObject{
    @Published var title: String = ""
    @Published var requiredSecurityPin: Bool = false
    @Published var isTeamMemberAvailable: Bool = false
    @Published var scheduledBy: Int = 0
    @Published var selectedWeekDays: Weekday = Weekday.monday
    @Published var intervalTime: String = ""
    @Published var intervalType: String = "Mins"

    @Published var isAnytimeChecked: Bool = false
    @Published var startTime: Date = Date()
    @Published var endTime: Date = Date()
    @Published var pictureAndNoteRequired: Int = 0

    
}
