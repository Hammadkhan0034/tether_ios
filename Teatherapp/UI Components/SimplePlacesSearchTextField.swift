//
//  SimplePlacesSearchTextField.swift
//  Teatherapp
//
//  Created by Hammad Khan on 15/10/2024.
//

import SwiftUI
import MapKit




struct SimplePlacesSearchTextFieldView: View {
    
    @State private var searchText = ""
    @State var places: [MyPlaceModel] = []
    @Binding var selectedPlace: MyPlaceModel
    @Binding var isPresented: Bool
    init(searchText: String = "", places: [MyPlaceModel] = [], selectedPlace: Binding<MyPlaceModel>, isPresented: Binding<Bool>) {
        self.searchText = searchText
        self.places = places
        self._selectedPlace = selectedPlace
        self._isPresented = isPresented
    }
    func searchPlaces(query: String) async {
        do{
            guard !query.isEmpty else{
                places.removeAll()
                return
            }
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = query
            
            let search = MKLocalSearch(request: request)
            let result: MKLocalSearch.Response? = try? await search.start()
            
            guard let placesResult = result else{
                print("Got empty in place search\(result.debugDescription)")
                return
            }
            print("places result")
            places.removeAll()
            for item in placesResult.mapItems{
                self.places.append(MyPlaceModel(name: item.placemark.title ?? "Unknown Place",latitude: item.placemark.coordinate.latitude, longitude:  item.placemark.coordinate.longitude,description: item.placemark.description))
            }
            }
         catch(let error){
            print(error)
        }
    }
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3).onTapGesture {
                isPresented = false
            }
            VStack(alignment:.center) {
                Text("Select Address").font(.title2).padding(.top)
                TextField("Search Places...", text: $searchText).frame(height: 50)
                    .onChange(of: searchText) {oldValue, newValue in
                        print(searchText)
                        Task{
                            await searchPlaces(query: searchText)
                        }
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                if(places.isEmpty){
                    Spacer()
                    Text("No Place To Show")
                    Spacer()
                }
                else{
                    List(places){ item in
                        HStack(alignment: .center){
                            Image(systemName: "mappin.and.ellipse").resizable().frame(width: 25,height: 25).padding(.trailing,5)
                            Text(item.name).font(.body).fontWeight(.medium).lineLimit(1)
                        }.listRowSeparator(.hidden).listRowInsets(.init(top: 10, leading: 20, bottom: 20, trailing: 20))
                            .onTapGesture{
                                selectedPlace = item
                                isPresented = false
                            }
                        
                    }.listStyle(.inset).scrollContentBackground(.hidden)
                }
            }.frame(width: .infinity, height: 400) // Set custom size here
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 20)
                .padding() // Padding to center the modal
            
        }.ignoresSafeArea()
    }
}

struct SimplePlacesSearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SimplePlacesSearchTextFieldView(selectedPlace: .constant(MyPlaceModel(name: "Domino", latitude: 0, longitude: 0,description: "Address of dominos")),isPresented: .constant(true))
    }
}
