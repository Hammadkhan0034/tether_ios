//
//  ReportMainView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 28/09/2024.
//

import SwiftUI

struct ReportMainView: View {
    @State var isSheetPresented = false
    @State var isExcelSelected = true
    var body: some View {
        
        NavigationView{
            
            VStack{
                AppBarView(title: "Reports")
                
                ReportTypeView(title: "Dispatch Report", onClick: {
                    //                isSheetPresented.toggle()
                })
                ReportTypeView(title: "Check-In Report", onClick: {
                    //                isSheetPresented.toggle()
                })
                ReportTypeView(title: "Notification History Report", onClick: {
                    //                isSheetPresented.toggle()
                })
                
                
                
                
                Spacer()
                
                HStack{
                    Spacer()
                    
                    NavigationLink(destination: {
                        AddEasterEggView().navigationBarBackButtonHidden(true)
                    }, label: {
                        Image("download_icon").resizable().frame(width:80,height:80)
                    }).navigationBarBackButtonHidden(true)
                }
            }.padding(.horizontal).sheet(isPresented: $isSheetPresented, content: {
                VStack(alignment: .leading){
                    HStack{
                        Text("Dispatch Report").font(.title2).foregroundStyle(.ligterBlueText).fontWeight(.medium)
                        Spacer()
                        TFButton(label: "Generate", onClick: {},width: 120,height: 35)
                    }.padding(.horizontal)
                    
                    Label(title: {Text(DateAndTimeUtils.formatDateToString(date: Date.now)+" to " + DateAndTimeUtils.formatDateToString(date: Date.now)).font(.body).fontWeight(.bold ).foregroundStyle(.white).padding(.leading)}, icon: {Image(systemName: "calendar").font(.title3).fontWeight(.bold ).foregroundStyle(.white)}).frame(width: UIScreen.screenWidth - 40,height: 50,alignment: .center).background(.appBlue).cornerRadius(radius: 50, corners: .allCorners).shadow(radius: 10).padding(.horizontal)
                    
                    HStack{
                        SelectAllRadioButton(title: "EXCEL", isSelected: isExcelSelected, onClick: {
                            isExcelSelected.toggle()
                        })
                        SelectAllRadioButton(title: "PDF", isSelected: !isExcelSelected, onClick: {
                            isExcelSelected.toggle()
                        })
                    }.frame(width: .infinity,height: 50).background(.backIconbackground).cornerRadius(radius: 50, corners: .allCorners).shadow(radius: 1).padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 0))
                    
                }.padding(.horizontal).frame( maxHeight: 150)
                    .presentationBackground(.clear)
            })
        }
    }
}

#Preview {
    ReportMainView()
}
