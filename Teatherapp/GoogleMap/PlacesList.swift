//
//  PlacesList.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 10/11/2023.
//

import SwiftUI
import GooglePlaces

struct PlacesList: View {
    // 1
    @ObservedObject private var placesManager = PlacesManager()
    
    var body: some View {
        NavigationView {
            // 2
            List(placesManager.places, id: \.place.placeID) { placeLikelihood in
                // 3
                PlaceRow(place: placeLikelihood.place)
            }
            .navigationBarTitle("Nearby Locations")
        }
    }
}

struct PlaceRow: View {
    // 1
    var place: GMSPlace
    
    var body: some View {
        HStack {
            // 2
            Text(place.name ?? "")
                .foregroundColor(.white)
            Spacer()
        }
    }
}
