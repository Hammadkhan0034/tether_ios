//
//  LocationRowView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 24/10/2024.
//

import SwiftUI

struct LocationRowView: View {
    let locationModel : LocationModel
    let deleteLocation: ()->Void
    let shareLocation: ()->Void
    let notificationLocation: ()->Void
    let editLocation: ()->Void
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "mappin.and.ellipse.circle.fill").resizable().frame(width: 60,height: 60).foregroundStyle(.appBlue)
                
                VStack(alignment: .leading, spacing: 0){
                    Text(locationModel.title).font(.title3).bold().foregroundStyle(.textBluishBlack).lineLimit(1).lineSpacing(-10)
                    HStack{
                        Text(locationModel.location).lineSpacing(0).font(.caption).fontWeight(.light ).foregroundStyle(.textBluishBlack).lineLimit(1...2)
                        Spacer()
                        Image(systemName: "xmark").resizable().frame(width:16,height:16).padding(.horizontal).onTapGesture(perform: deleteLocation)
                        Image(systemName: "bell.circle.fill").resizable().frame(width:25,height:25).foregroundStyle(.appBlue)
                    }
                    Text("Created By \(locationModel.createdBy)").font(.caption).foregroundStyle(.green).padding(.horizontal,10).overlay {
                        RoundedRectangle(cornerSize: .init(width: 15, height: 15), style: .circular).foregroundStyle(.green.opacity(0.15))
                    }.padding(.top,5)
                }
                
            }.padding(.horizontal)
            
            HStack{
                Spacer()
                SimpleTextButtonView(title: "Share", width: 70, height:25, textColor: .textBluishBlack, cornerRadius: 4, fontWeight: .regular).padding(.trailing).onTapGesture(perform: shareLocation)
                SimpleTextButtonView(title: "EDIT", width: 50,height: 25, textColor: .textBluishBlack, cornerRadius: 4, fontWeight: .regular, font: .caption).onTapGesture(perform: editLocation)
            }.padding(.trailing)
            Rectangle().frame(height:1).foregroundStyle(.gray.opacity(0.5)).padding(.top,5)

        }
    }
}

#Preview {
    LocationRowView(locationModel: testLocations.first!, deleteLocation: {},shareLocation: {}, notificationLocation: {},editLocation: {})
}

