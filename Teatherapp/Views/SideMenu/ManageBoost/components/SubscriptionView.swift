//
//  SubscriptionView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 27/09/2024.
//

import SwiftUI

struct SubscriptionView: View {
    @State var selectedSubscriptionType = 0
    var body: some View {
        ZStack{
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundStyle(.sky).frame(maxWidth:250,minHeight: 120,maxHeight: 120)
            
            VStack{
                Button(action: {
                    selectedSubscriptionType = 0
                }, label: {
                    Text("$5.00/mo").fontWeight(.semibold).foregroundStyle(selectedSubscriptionType == 0 ? .appBlue : .textGrey).frame(width: 220,height: 40).background(selectedSubscriptionType == 0 ? .white : .sky).cornerRadius(radius: 40, corners: .allCorners).overlay( /// apply a rounded border
                        selectedSubscriptionType == 0 ?
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.appBlue, lineWidth: 1) : nil
                    )
                })
                
                
                    Button(action: {
                        selectedSubscriptionType = 1
                    }, label: {
                        Text("$2.00/mo").fontWeight(.semibold).foregroundStyle(selectedSubscriptionType == 1 ? .appBlue : .textGrey).frame(width: 220,height: 40).background(selectedSubscriptionType == 1 ? .white : .sky).cornerRadius(radius: 40, corners: .allCorners).overlay( /// apply a rounded border
                            selectedSubscriptionType == 1 ?
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(.appBlue, lineWidth: 1) : nil
                        )
                    })
            }
        }
    }
}

#Preview {
    SubscriptionView()
}
