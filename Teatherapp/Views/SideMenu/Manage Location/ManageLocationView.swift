//
//  ManageLocationView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 30/09/2024.
//

import SwiftUI
import SwiftData

struct ManageLocationView: View {
    @Environment(\.modelContext) var modelContext
    @State var viewModel = ManageLocationViewModel()
    var body: some View {
        
            
                VStack{
                    AppBarView(title: "Locations").padding(.horizontal)
                    NavigationLink {
                        AddNewLocationView().navigationBarBackButtonHidden(true)
                    } label: {
                        HStack{
                            Image(systemName: "plus.circle.fill").resizable().frame(width: 50,height: 50).foregroundStyle(.appBlue)
                            Text("Add a new Location").font(.title3).bold().foregroundStyle(.appBlue).padding(.leading)
                            Spacer()
                        }.padding(.horizontal)
                    }

                    
                    
                    Rectangle().foregroundStyle(.gray.opacity(0.5
                                                             )).frame(height: 1)
                    if(viewModel.isLoading){
                        Spacer()
                    }
                    if(!viewModel.locations.isEmpty){
                        List(viewModel.locations){location in 
                            LocationRowView(locationModel: location, deleteLocation: {
                                viewModel.showDeleteLocationConfirmation(location: location)
                            }, shareLocation: {
                                viewModel.shareLocation(location: location)
                            }, notificationLocation: {
                                viewModel.notificationLocation(location: location)
                            }, editLocation: {
                                viewModel.editLocation(location: location)
                            }).listRowSeparator(.hidden).listRowInsets(EdgeInsets())
                        }.listStyle(.inset)
                    }
                    
                    if(viewModel.isLoading != true && viewModel.locations.isEmpty)
                    {
                        VStack{
                            Spacer()
                            
                            Image(systemName: "text.page.badge.magnifyingglass").resizable().frame(width: 40,height: 50).foregroundStyle(.appBlue)
                            Text("Unable to get location data").font(.headline)
                            Text("Please add a new location").font(.caption)
                            Spacer()
                            
                        }
                    }
                    
                }.overlay{
                    SimpleToastView(message: viewModel.successMessage, isShowing: $viewModel.isSnackbarPresented)
                    if(viewModel.isLoading){
                        LoadingView()
                    }
                    
                    if(viewModel.showConfirmation){
                        ConfirmationDialogView(title: "Remove Location!", description: "Are you sure you want to Remove Location",onConfirm:{ Task{await viewModel.deleteLocation()}}, showLocation: $viewModel.showConfirmation)
                    }
                    
                }.alert(viewModel.errorMessage, isPresented: $viewModel.isAlertPresented) {
                    
                }.sheet(isPresented: $viewModel.isShowingBottomsheet, content: {
                    SelectMemberView(locationId: viewModel.selectedLocationId)
                }).onAppear{
                    Task{
                        await viewModel.getLocations()
                    }
                }
                
    }
}

#Preview {
    ManageLocationView()
}
