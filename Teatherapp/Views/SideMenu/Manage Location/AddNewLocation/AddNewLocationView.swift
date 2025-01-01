//
//  AddNewLocationView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 20/10/2024.
//

import SwiftUI
import MapKit
struct AddNewLocationView: View {
    
    let existingLocation : LocationModel?
    
    @Environment(\.dashboardVM) var dashboardVM
    @Environment(\.dismiss) var dismiss
    
    @State var viewModel = AddNewLocationViewModel()
    
    init(existingLocation: LocationModel? = nil) {
        self.existingLocation = existingLocation
    }
    
    var body: some View {
        
        ScrollView{
            VStack{
                AppBarView(title: viewModel.isEdit ? "Update Location" : "Add New Location").padding(.horizontal)
                
                AddNewLocationMapComponent(myPlaceModel: $viewModel.myPlaceModel,circleRadius: viewModel.isFeetSelected ? viewModel.distance * 0.3048 : viewModel.distance * 1609.34)
                AddNewLocationDistanceRowView(isFeetSelected: $viewModel.isFeetSelected, distance: $viewModel.distance).padding()
                
                BackgroundViewWrapper(text: "Location Details")
                
                
                SimpleTextField(placeHolder: "Enter Title", inputField: $viewModel.title).padding(.horizontal)
                
                SimpleTextField(placeHolder: "Enter Address", inputField: $viewModel.myPlaceModel.name,  isDisabled: true).padding(.horizontal).onTapGesture {
                    viewModel.isShowingSelectAddress = true
                }
                BackgroundViewWrapper(text:"Get notified when...")
                
                
                HStack{
                    Text("MARK ALL:")
                    Spacer()
                    Toggle("Arrives", isOn: $viewModel.selectAllArrives).frame(width: 115).onChange(of: viewModel.selectAllArrives) { oldValue, newValue in
                        viewModel.selectAllArivesList()
                        
                    }.tint(.appBlue)
                    Spacer()
                    Toggle("Leaves", isOn: $viewModel.selectAllLeaves).frame(width: 110).tint(.appBlue).onChange(of: viewModel.selectAllArrives) { oldValue, newValue in
                        viewModel.selectAllLeavesList()
                        
                    }
                    
                }.padding(.horizontal)
                
                List(viewModel.memberNotificationConfigList){member in
                    HStack{
                        InitialsOnCircleView(name: member.name, radius: 30, circleColor: .red)
                        Text(member.name).bold()
                        Spacer()
                        VStack{
                            Toggle("Arrives", isOn: $viewModel.selectAllArrives).frame(width: 115).onChange(of: viewModel.selectAllArrives) { oldValue, newValue in
                            }.tint(.appBlue)
                            Spacer()
                            Toggle("Leaves", isOn: $viewModel.selectAllLeaves).frame(width: 110).tint(.appBlue).onChange(of: viewModel.selectAllArrives) { oldValue, newValue in
                            }
                        }
                        
                    }.listRowSeparator(.hidden).listRowInsets(.init()).padding(.horizontal)
                    
                }.listStyle(.inset).listRowSpacing(0).frame(height: 200)
                
                TFButton(label: "Save Location",onClick: {Task{await viewModel.saveLocation()}}).padding(.all)
                Spacer()
                
            }
        }.onAppear(perform: {
            if let members = dashboardVM.selectedCircle?.members{
                for i in 0..<members.count {
                    viewModel.memberNotificationConfigList.append(MemberNotificationSelectModel(id: members[i].id, name: members[i].name))
                }
            }
            viewModel.initEdit(locationModel: existingLocation)
        })
        
        
        
        
        .overlay{
            if(viewModel.isLoading){
                LoadingView()
            }
            if(viewModel.isShowingSelectAddress){
                withAnimation(.easeInOut) {
                    SimplePlacesSearchTextFieldView(selectedPlace: $viewModel.myPlaceModel, isPresented: $viewModel.isShowingSelectAddress)
                }
            }
        }.alert(viewModel.errorMessage, isPresented: $viewModel.isAlertPresented) {
            
        }.onChange(of: viewModel.shouldDismiss, { oldValue, newValue in
            if(viewModel.shouldDismiss){
                dismiss()
            }
        }).navigationBarTitle("",displayMode: .inline).navigationBarHidden(true)
    }
}

#Preview {
    AddNewLocationView()
}
