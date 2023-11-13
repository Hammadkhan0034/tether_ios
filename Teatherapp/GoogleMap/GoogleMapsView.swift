//
//  GoogleMapsView.swift
//  Teatherapp
//
//  Created by Auxilium.Digital on 21/10/2023.
//

import SwiftUI
import GoogleMaps

struct GoogleMapsView: UIViewRepresentable {

    @EnvironmentObject var locationManager: LocationManager

    @Binding var isSatellite : Bool
    @Binding var isCurrentLocation : Bool
    
    private let zoom: Float = 20.0
    
    func makeUIView(context: Self.Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: locationManager.latitude, longitude: locationManager.longitude, zoom: zoom)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.camera = camera
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude)
        marker.title = UserDefaults.standard.string(forKey: "name") ?? ""
//        marker.snippet = "Description"
        marker.map = mapView
        mapView.selectedMarker = marker
        
        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Context) {

        if isCurrentLocation {
            mapView.clear()
            
            let camera = GMSCameraPosition.camera(withLatitude: locationManager.latitude, longitude: locationManager.longitude, zoom: zoom)
            mapView.camera = camera
            mapView.animate(toLocation: CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude))
            
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude)
            marker.title = "Name"
//            marker.snippet = "Description"
            marker.map = mapView
            mapView.selectedMarker = marker
            
            self.isCurrentLocation = false
        }
        
        if isSatellite {
            mapView.mapType = GMSMapViewType.satellite
        }
        else {
            mapView.mapType = GMSMapViewType.normal
        }
    }
}

//struct GoogleMapsView_Previews: PreviewProvider {
//    static var previews: some View {
//        GoogleMapsView()
//    }
//}
