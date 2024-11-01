//
//  AddNewLocationView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 20/10/2024.
//

import SwiftUI
import MapKit
struct AddNewLocationView: View {
    @Environment(\.dashboardVM) var dashboardVM
    @Environment(\.dismiss) var dismiss

    @State var viewModel = AddNewLocationViewModel()

    var body: some View {
            
            ScrollView{
                VStack{
                    AppBarView(title: "Add New Location").padding(.horizontal)
                    
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
                            
                        }.tint(.appBlue)
                        Spacer()
                        Toggle("Leaves", isOn: $viewModel.selectAllLeaves).frame(width: 110).tint(.appBlue).onChange(of: viewModel.selectAllArrives) { oldValue, newValue in
                            
                        }
                        
                    }.padding(.horizontal)
                    
                    List(viewModel.circleMembers){circleMember in
                        HStack{
                            InitialsOnCircleView(initials: circleMember.name.initials, radius: 30, circleColor: .red)
                            Text(circleMember.name).bold()
                            Spacer()
                            VStack{
                                Toggle("Arrives", isOn: $viewModel.selectAllArrives).frame(width: 115).onChange(of: viewModel.selectAllArrives) { oldValue, newValue in
                                    viewModel.selectAllArivesList()
                                }.tint(.appBlue)
                                Spacer()
                                Toggle("Leaves", isOn: $viewModel.selectAllLeaves).frame(width: 110).tint(.appBlue).onChange(of: viewModel.selectAllArrives) { oldValue, newValue in
                                    viewModel.selectAllLeavesList()
                                }
                            }
                            
                        }.listRowSeparator(.hidden).listRowInsets(.init()).padding(.horizontal)

                    }.listStyle(.inset).listRowSpacing(0).frame(height: 200)
                    
                    TFButton(label: "Save Location",onClick: {Task{await viewModel.saveLocation {
                        dismiss()
                    }}}).padding(.all)
                    Spacer()
                    
                }
            }.onAppear(perform: {
                viewModel.circleMembers.append(contentsOf: dashboardVM.selectedCircle?.members ?? [])
                for i in 0..<viewModel.circleMembers.count {
                    viewModel.memberNotificationConfigList.append(MemberNotificationSelectModel(userId: viewModel.circleMembers[i].id))
                }
                print(viewModel.circleMembers.count)
            })
            
            
            
            
        .overlay{
            SimpleToastView(message: viewModel.successMessage, isShowing: $viewModel.isSnackbarPresented)
            if(viewModel.isLoading){
                LoadingView()
            }
            if(viewModel.isShowingSelectAddress){
                withAnimation(.easeInOut) {
                    SimplePlacesSearchTextFieldView(selectedPlace: $viewModel.myPlaceModel, isPresented: $viewModel.isShowingSelectAddress)
                }
            }
        }.alert(viewModel.errorMessage, isPresented: $viewModel.isAlertPresented) {
            
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AddNewLocationView()
}
