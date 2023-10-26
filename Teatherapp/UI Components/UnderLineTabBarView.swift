//
//  UnderLineTabBarView.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 26/10/2023.
//

import SwiftUI

struct UnderLineTabBarView: View {
    
    @Binding var currentBtn: Int
    @Binding var firstBtnName: String
    @Binding var secondBtnName: String
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(Color.white)
                .frame(maxWidth: .infinity, maxHeight: 40)
                .overlay{
                    HStack{

                        TabBarItem(currentBtn: self.$currentBtn,
                                   btnName: self.firstBtnName,
                                   btn: 0)
                        
                        TabBarItem(currentBtn: self.$currentBtn,
                                   btnName: self.secondBtnName,
                                   btn: 1)
                    }
                }
        }
    }
}

struct TabBarItem: View {
    
    @Binding var currentBtn: Int
    
    var btnName: String
    
    var btn: Int
    
    var body: some View {
        VStack{
            Button {
                self.currentBtn = btn
            } label: {
                VStack {
                    if currentBtn == btn {
                        HStack{
                            Text(btnName)
                                .bold()
                                .foregroundColor(Color.appBlue)
                                .padding(.vertical, 7)
                        }
                        
                        Color.appBlue
                            .frame(height: 2)
                            .offset(y: 3)

                    }
                    else {
                        HStack{
                            Text(btnName)
                                .bold()
                                .foregroundColor(Color.gray)
                                .padding(.vertical, 7)
                            
                        }
                        Color.gray
                            .frame(height: 2)
                            .offset(y: 3)
                    }
                }
                .animation(.spring(), value: self.currentBtn)
            }
            .buttonStyle(.plain)
        }
    }
}
