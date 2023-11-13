//
//  CheckinView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 11/09/2023.
//

import SwiftUI

struct CheckinView: View {
    
    @EnvironmentObject var tfModel: TFBottomBarModel
    
    @State var name : String = ""
    @State var showCameraPicker : Bool = false
    @State var notes : String = ""
    
    var body: some View {
        VStack{
            Text("Hi \(self.name)")
                .font(.headline)
                .foregroundColor(Color.appBlue)
            
            Text("Create a Check In by taking pictures, writing a note or both")
                .multilineTextAlignment(.center)
                .foregroundColor(Color.appBlue)
            
            Button(action: {
                showCameraPicker = true
            }, label: {
                HStack{
                    Image(systemName: "camera")
                        .foregroundColor(.white)
                    
                    Text("Take Picture")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .padding()
            })
            .background(Rectangle().fill(Color.checkinGray).cornerRadius(10.0))
            .padding(.bottom, 4)
            
            TextField("Notes",text: $notes,axis: .vertical)
                .lineLimit(6)
                .padding(.horizontal)
                .frame(height: 100)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .autocorrectionDisabled()
                .offset(y: -25)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.bottom, 2)
            
            Button(action: {
                
            }, label: {
                Text("Check In")
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal,30)
                    .foregroundColor(.white)
                    .background(Capsule().fill(Color.appBlue))
            })
        }
        .padding()
        .background(Rectangle().fill(.white).cornerRadius(20))
        .onAppear{
            self.name = UserDefaults.standard.string(forKey: "name") ?? ""
        }
    }
}

#Preview {
    CheckinView()
}
