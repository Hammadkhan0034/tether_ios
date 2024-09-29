//
//  AddEasterEggView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 27/09/2024.
//

import SwiftUI

struct AddEasterEggView: View {
    @StateObject var addEasterEggViewModel = AddEasterEggViewModel()
    var body: some View {
        ScrollView{
            VStack{
                VStack(alignment: .leading){
                    
                    AppBarView(title: "Add Easter Egg Location")
                    EasterEggTypeDropdownMenuView(selectedOption: $addEasterEggViewModel.easterEggType).frame(height: 60).overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    SimpleTextField(placeHolder: "Enter Title", inputField: $addEasterEggViewModel.title).padding(.top)
                    SimpleTextField(placeHolder: "Search address or location name", inputField: $addEasterEggViewModel.address)
                    if (addEasterEggViewModel.easterEggType == "Specific Day Of The Week"){
                        VStack(alignment: .leading){
                            Text("Select Days:").font(.title3).foregroundStyle(.textBluishBlack).lineSpacing(0)
                            HStack{
                                DayRadioButtonView(selectedWeekday: $addEasterEggViewModel.selectedWeekDay, weekday: Weekday.monday).frame(maxWidth: .infinity)
                                DayRadioButtonView(selectedWeekday: $addEasterEggViewModel.selectedWeekDay, weekday: Weekday.tuesday).frame(maxWidth: .infinity)
                                DayRadioButtonView(selectedWeekday: $addEasterEggViewModel.selectedWeekDay, weekday: Weekday.wednesday).frame(maxWidth: .infinity)
                                DayRadioButtonView(selectedWeekday: $addEasterEggViewModel.selectedWeekDay, weekday: Weekday.thursday).frame(maxWidth: .infinity)
                                DayRadioButtonView(selectedWeekday: $addEasterEggViewModel.selectedWeekDay, weekday: Weekday.friday).frame(maxWidth: .infinity)
                                DayRadioButtonView(selectedWeekday: $addEasterEggViewModel.selectedWeekDay, weekday: Weekday.saturday).frame(maxWidth: .infinity)
                                DayRadioButtonView(selectedWeekday: $addEasterEggViewModel.selectedWeekDay, weekday: Weekday.sunday).frame(maxWidth: .infinity)
                            }.padding(.horizontal)
                        }
                    }
                    if (addEasterEggViewModel.easterEggType == "Specific Day"){
                        
                        HStack{
                            SimpleTextButtonView(title: addEasterEggViewModel.selectedSpecificDayString).overlay{ //MARK: Place the DatePicker in the overlay extension
                                DatePicker(
                                    "Select Date",
                                    selection: $addEasterEggViewModel.selectedSpecificDay,
                                    in: Date()..., displayedComponents: [.date]
                                )
                                .blendMode(.destinationOver).onChange(of: addEasterEggViewModel.selectedSpecificDay) { newDay in
                                    addEasterEggViewModel.selectedSpecificDayString = Calendar.current.isDate(addEasterEggViewModel.selectedSpecificDay, inSameDayAs: Date.now) ? "Select Day" : DateAndTimeUtils.formatDateToString(date: addEasterEggViewModel.selectedSpecificDay)
                                } //MARK: use this extension to keep the clickable functionality
                            }
                            Spacer()
                            SimpleTextButtonView(title: addEasterEggViewModel.selectedSpecificTimeString).overlay{ //MARK: Place the DatePicker in the overlay extension
                                DatePicker(
                                    "Select Time", selection: $addEasterEggViewModel.selectedTimeDay,
                                    in: Date()..., displayedComponents: [.hourAndMinute]
                                )
                                .blendMode(.destinationOver).onChange(of: addEasterEggViewModel.selectedTimeDay) { newTime in
                                    addEasterEggViewModel.selectedSpecificTimeString = DateAndTimeUtils.formatDateToTimeString(date:addEasterEggViewModel.selectedTimeDay)
                                } //MARK: use this extension to keep the clickable functionality
                            }
                        }.padding(.top)}
                        
                        Text("Frequency").font(.title3).foregroundColor(.textBluishBlack)
                        HStack(){
                            RadioViewFrequency(selected: $addEasterEggViewModel.frequency, frequency: EasterEggFrequency.oneTime)
                            Spacer()
                            RadioViewFrequency(selected: $addEasterEggViewModel.frequency, frequency: EasterEggFrequency.always)
                            Spacer()
                            RadioViewFrequency(selected: $addEasterEggViewModel.frequency, frequency: EasterEggFrequency.showAndBurn)
                            
                        }.padding(.horizontal)
                    if (addEasterEggViewModel.easterEggType == "Between The Period Of Time"){
                        
                        
                        TimeSelectView(startTime: $addEasterEggViewModel.selectedPeriodStartTime, endTime: $addEasterEggViewModel.selectedPeriodEndTime)}
                    
                    
                    SimpleTextField(placeHolder: "Enter Note", inputField: $addEasterEggViewModel.note).padding(.top)
                        SimpleTextField(placeHolder: "Enter URL", inputField: $addEasterEggViewModel.url)
                        
                        AddMediaButtonView().padding()
                    }.padding(.horizontal)
                    
                    ZStack(alignment: .leading){
                        Rectangle().frame(width: .infinity, height: 50).foregroundColor(.gray.opacity(0.5))
                        Text("Share with members").font(.title3).fontWeight(.semibold).foregroundColor(.checkinGray).padding(.leading)
                    }
                    
                    HStack{
                        Spacer()
                        SelectAllRadioButton(title:"Select All",isSelected: addEasterEggViewModel.isAllSelected, onClick: {
                            addEasterEggViewModel.isAllSelected.toggle()
                        })
                    }.padding(.horizontal)
                    TFButton(label: "ADD EASTER EGG", onClick: {}).padding(.horizontal).padding(.top)
                    
                }}
        }
    }

#Preview {
    AddEasterEggView()
}
