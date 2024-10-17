//
//  SimplePlacesSearchTextField.swift
//  Teatherapp
//
//  Created by Hammad Khan on 15/10/2024.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    let description: String?
}


struct SimplePlacesSearchTextFieldView: View {
    @State private var searchText = ""
    @State var places: [Place] = []
    @Binding var selectedPlace: Place
    init(searchText: String = "", places: [Place]=[Place(name: "Domino", latitude: 0, longitude: 0,description: "Address of dominos"),
                                                   Place(name: "Domino", latitude: 0, longitude: 0,description: nil)], selectedPlace: Binding<Place>) {
        self.searchText = searchText
        self.places = places
        self._selectedPlace = selectedPlace
    }
    func searchPlaces(query: String) async {
        do{
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
                self.places.append(Place(name: item.placemark.title ?? "Unknown Place",latitude: item.placemark.coordinate.latitude, longitude:  item.placemark.coordinate.longitude,description: item.placemark.description))
            }
            }
         catch(let error){
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            TextField("Search Places...", text: $searchText)
                .onChange(of: searchText, {
                    print(searchText)
                    Task{
                        await searchPlaces(query: searchText)
                    }
                })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            if(places.isEmpty){
                Text("No Place To Show")
            }
            else{
                List(places){ item in
//                    HStack(alignment: .center){
//                        Image(systemName: "mappin.and.ellipse").resizable().frame(width: 25,height: 25).padding(.trailing,5)
//                        VStack(alignment: .leading,spacing: 0){
                    Text(item.name).font(.body).fontWeight(.medium).lineLimit(1)
//                            if(item.description != nil) {Text(item.description!).font(.footnote).multilineTextAlignment(.leading)}
//                        }
//                    }
//                    .frame(height: 40)
                    .onTapGesture{
                            selectedPlace = item
                        }
                    
                }.listRowBackground(Color.clear).listRowSeparator(.hidden).scrollContentBackground(.hidden)
            }
        }.background(.white)
        .padding()
    }
}

struct SimplePlacesSearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SimplePlacesSearchTextFieldView(selectedPlace: .constant(Place(name: "Domino", latitude: 0, longitude: 0,description: "Address of dominos")))
    }
}
