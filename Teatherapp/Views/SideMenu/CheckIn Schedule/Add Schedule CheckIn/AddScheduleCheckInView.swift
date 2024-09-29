//
//  AddScheduleCheckInView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 29/09/2024.
//

import SwiftUI

struct AddScheduleCheckInView: View {
    @StateObject var viewModel = AddScheduleCheckInViewModel()
    
    var body: some View {
        VStack{
            AppBarView(title: "Schedule Check-In").padding(.horizontal)
            ScrollView{
                VStack{
                    
                    AddCheckInTitleView(title: $viewModel.title, isChecked: $viewModel.requiredSecurityPin).padding(.top)
                    AddCheckInScheduleBy(scheduledBy: $viewModel.scheduledBy).padding(.top)
                    
                    AddScheduleCheckInTeamMemberMustBe(isTeamMemberAvailable: $viewModel.isTeamMemberAvailable)
                    
                    
                    AddCheckInSelectDays(selectedWeekDays: $viewModel.selectedWeekDays)
                        
                    
                        
                        HStack{
                            
                            Text("Interval Every").font(.headline).fontWeight(.medium)
                            SimpleTextField(placeHolder: "30", inputField: $viewModel.intervalTime, height: 35, width: 80, radius: 35)
                            
                            
                              Menu(content: {
                                      


                                  Button("Mins", action: { viewModel.intervalType = "Mins" })
                                      Button("Hours", action: { viewModel.intervalType = "Hours" })
                                      
                              }
                    , label: {
                                  HStack {
                                      Text(viewModel.intervalType).foregroundColor(.white).fontWeight(.semibold).padding(.leading)
                                            Spacer()
                                      Image(systemName: viewModel.intervalType=="" ? "chevron.up" : "chevron.down").foregroundColor(.white).padding(.trailing)
                                          }
                                  .frame(width: 120,height: 35).background(.appBlue)
                                  .cornerRadius(35)

                              }).environment(\.menuOrder, .fixed)

                            Spacer()
                        }.padding(.leading).padding(.vertical).background(.white)
                    
                    
                    
                    
                    VStack(alignment: .leading, spacing: 5){
                            SimpleCheckBox(isChecked: viewModel.isAnytimeChecked, onClick: {
                                viewModel.isAnytimeChecked.toggle()
                            },title: "ANYTIME").padding(.top)
                        
                        TimeSelectView(startTime: $viewModel.startTime, endTime: $viewModel.endTime).padding(.bottom)
                    }.padding(.horizontal).background(.white)
                    
                    
                    
                    VStack(alignment: .leading, spacing: 5){
                        
                        Text("Picture & Note Required:").font(.headline).fontWeight(.medium).padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        HStack{
                            
                            SelectAllRadioButton(title: "Picture Only", isSelected: viewModel.pictureAndNoteRequired==0, onClick: {
                                viewModel.pictureAndNoteRequired = 0
                            },size: 20,font: .caption)
                            SelectAllRadioButton(title: "Picture & Note", isSelected: viewModel.pictureAndNoteRequired==0, onClick: {
                                viewModel.pictureAndNoteRequired = 0
                            },size: 20,font: .caption)
                            SelectAllRadioButton(title: "None", isSelected: viewModel.pictureAndNoteRequired==0, onClick: {
                                viewModel.pictureAndNoteRequired = 0
                            },size: 20,font: .caption)
                        }
                    }.padding(.horizontal).background(.white)
                    
                    
                    
                    
                    VStack(alignment: .leading){
                            SimpleCheckBox(isChecked: viewModel.isAnytimeChecked, onClick: {
                                viewModel.isAnytimeChecked.toggle()
                            },title: "Sub tasks completing required?").padding(.top)
                        HStack{
                            
                            Text("Sub-tasks").font(.headline).fontWeight(.medium)
                            Spacer()
                            TFButton(label: "Add", onClick: {}, width: 100,height: 40)
                        }.padding(.bottom)
                    }.padding(.horizontal).background(.white)
                    
                    TFButton(label: "Submit", onClick: {}).padding()
                        
                    Spacer(minLength: 200)
                    }.background(.gray.opacity(0.1))

            }
            
            }
        }
    }

#Preview {
    AddScheduleCheckInView()
}
