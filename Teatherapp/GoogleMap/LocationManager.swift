//
//  LocationViewModel.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 29/12/2023.
//

import SwiftUI
import MapKit
import CoreLocationUI

final class LocationManager: NSObject, ObservableObject {
    
    var manager = CLLocationManager()
    var mapType : MKMapType  = .standard
    
    @Published var locations : [Locations] = []
    @Published var userTrackingMode : MapUserTrackingMode = .follow
    @Published var region = MKCoordinateRegion(
        center: .init(latitude: 37.334_900, longitude: -122.009_020),
        span: .init(latitudeDelta: 1.0, longitudeDelta: 1.0)
    )
    
    override init() {
        
        super.init()
        
        self.manager.delegate = self
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
        self.setup()
    }
    
    func setup() {
        switch manager.authorizationStatus {
        //If we are authorized then we request location just once, to center the map
        case .authorizedWhenInUse:
            manager.requestLocation()
        //If we don´t, we request authorization
        case .notDetermined:
            manager.startUpdatingLocation()
            manager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
    
    func toggleMapType() {
        mapType = (mapType == .standard) ? .satellite : .standard
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard .authorizedWhenInUse == manager.authorizationStatus else { return }
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Something went wrong: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        locations.last.map {
            region = MKCoordinateRegion(
                center: $0.coordinate,
                span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )
        }
    }
}
