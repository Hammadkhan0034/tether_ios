//
//  ManageBoostView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 25/09/2024.
//

import SwiftUI

struct ManageBoostView: View {
    var body: some View {
        ZStack(alignment:.topLeading){
            BottomRoundedBackgroundRectangle()
            
            VStack{
                AppBarView(title: "Tether Premium")
                
                TFButton(label: "PREMIUM", onClick: {},textColor: .appBlue,backgroundColor: .darkSky).padding(.horizontal)
                PackageCard().padding()
                SubscriptionView()

                HStack{
                    Text("Learn about subscriptions and boosts").foregroundStyle(.ligterBlueText).font(.subheadline)
                    Text("Refund Policy").foregroundStyle(.ligterBlueText).font(.subheadline)
                }
                Spacer()
                Text("Your subscription will automatically renew at the end of each term and your default credit/debit card will be charged. If you wish to avoid auto renewal, you must turn it off atleast 24 hours prior to the end of term period.").font(.caption2)
                Spacer()
                
            }.padding()
            
            }


    }
}

#Preview {
    ManageBoostView()
}
