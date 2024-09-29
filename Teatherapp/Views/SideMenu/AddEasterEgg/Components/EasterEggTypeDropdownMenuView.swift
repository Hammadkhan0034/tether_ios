//
//  EasterEggTypeDropdownMenuView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 27/09/2024.
//

import SwiftUI

struct EasterEggTypeDropdownMenuView: View {
    @Binding var selectedOption: String
    @State var isOpened = false

      var body: some View {
        
          Menu(content: {
                  


                Button("Location Base", action: { selectedOption = "Location Base" })
                  Button("Specific Day", action: { selectedOption = "Specific Day" })
                  Button("Specific Day Of The Week", action: { selectedOption = "Specific Day Of The Week" })
              VStack{Button("Between The Period Of Time", action: { selectedOption = "Between The Period Of Time" })



              }
          }
, label: {
              HStack {
                  Text(selectedOption).foregroundColor(.textBluishBlack).fontWeight(.semibold).padding(.leading)
                        Spacer()
                  Image(systemName: isOpened ? "chevron.up" : "chevron.down").foregroundColor(.textBluishBlack).padding(.trailing)
                      }
              .frame(width: .infinity,height: 50)
                  .cornerRadius(8).shadow(radius: 10)

          }).environment(\.menuOrder, .fixed)   // << here !!

      }
}

#Preview {
    EasterEggTypeDropdownMenuView(selectedOption: .constant("Location Base"))
}
