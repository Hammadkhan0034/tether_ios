//
//  DispatchHistoryView.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 26/10/2023.
//

import SwiftUI

struct DispatchHistoryView: View {
    
    @State var searchKey : String = ""
    
    var body: some View {
        VStack{
            HStack{
                TextField("Search...", text: $searchKey)
                    .padding(.leading)
                    .frame(height: 50)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                Spacer()
                
                Button(action: {
                    if !searchKey.isEmpty{
                        searchKey = ""
                    }
                }, label: {
                    Image(systemName: searchKey.isEmpty ? "magnifyingglass" : "multiply")
                })
                .padding(.trailing)
                .frame(width: 25, height: 25)

            }
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.appBlue, lineWidth: 1))
            
            Spacer()
            
            Text("No Data")
                .bold()
            
            Spacer()

        }
    }
}

#Preview {
    DispatchHistoryView()
}
