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
    
    @Binding var mapType : GMSMapViewType
    @Binding var cameraPosition : Bool
    @Binding var userLocations: [UserLocation]
    
    //MARK: - Make UIView
    func makeUIView(context: Self.Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: locationManager.latitude, longitude: locationManager.longitude, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.camera = camera
        mapView.mapType = mapType
        
        return mapView
    }
    
    //MARK: - Update UIView
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        if cameraPosition {
            mapView.clear()

            let camera = GMSCameraPosition.camera(withLatitude: locationManager.latitude, longitude: locationManager.longitude, zoom: 15)
            mapView.camera = camera
            mapView.animate(toLocation: CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude))

            addMarkers(locations: userLocations, to: mapView)

            cameraPosition = false
        }

        mapView.mapType = mapType
    }

    
    // Function to add a marker to the map
    func addMarkers(locations: [UserLocation], to mapView: GMSMapView) {
        for location in locations {
            let marker = GMSMarker()
            marker.position = location.position
            marker.map = mapView

            if let profileImage = UIImage(named: "\(location.image)") {
                marker.icon = customMarker(profilePic: profileImage, markerPic: UIImage(named: "marker")!)
            } else {
                marker.icon = customMarker(profilePic: UIImage(named: "userPlaceholder")!, markerPic: UIImage(named: "marker")!)
            }
        }
    }


    
    
    
    
    
    
    
    
    
    //MARK: - Make the Custom Marker
    func customMarker(profilePic: UIImage, markerPic: UIImage) -> UIImage {
        
        let imgView = UIImageView(image: markerPic)
        let picImgView = UIImageView(image: profilePic)
        
        picImgView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        imgView.addSubview(picImgView)
        picImgView.center.x = imgView.center.x
        picImgView.center.y = imgView.center.y - 7
        picImgView.layer.cornerRadius = picImgView.frame.width/2
        picImgView.clipsToBounds = true
        imgView.setNeedsLayout()
        picImgView.setNeedsLayout()
        
        let newImage = imageWithView(view: imgView)
        return newImage
    }
    
    func imageWithView(view: UIView) -> UIImage {
        var image: UIImage?
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        if let context = UIGraphicsGetCurrentContext() {
            view.layer.render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        return image ?? UIImage()
    }
}

//struct GoogleMapsView_Previews: PreviewProvider {
//    static var previews: some View {
//        GoogleMapsView()
//    }
//}
