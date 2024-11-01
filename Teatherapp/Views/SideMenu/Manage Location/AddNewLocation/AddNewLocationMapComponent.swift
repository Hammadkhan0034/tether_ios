//
//  AddNewLocationMapComponent.swift
//  Teatherapp
//
//  Created by Hammad Khan on 20/10/2024.
//

import SwiftUI
import MapKit

struct AddNewLocationMapComponent: View {
    @Binding var myPlaceModel: MyPlaceModel
    var circleRadius: Double
    @State var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @State var userLocation :CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.334606, longitude: -122.009102
)
    var locationManager = CLLocationManager()
    var body: some View {
            Map(position: $cameraPosition,interactionModes: .all, content: {
                MapCircle(center: CLLocationCoordinate2D(latitude: myPlaceModel.latitude, longitude: myPlaceModel.longitude), radius: circleRadius).foregroundStyle(.orange.opacity(0.5)).stroke(.orange, lineWidth: 2)
                Marker(myPlaceModel.name, coordinate: CLLocationCoordinate2DMake(myPlaceModel.latitude, myPlaceModel.longitude)).tint(.appBlue)
            }).mapControls({
                MapUserLocationButton()
            }).onAppear{
                locationManager.requestWhenInUseAuthorization()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    if let location = locationManager.location?.coordinate {
                        if(myPlaceModel.name.isEmpty){
                            myPlaceModel.latitude = location.latitude
                            myPlaceModel.longitude = location.longitude
                            
                        }else{
                            cameraPosition = .region(.init(center: .init(latitude: myPlaceModel.latitude, longitude: myPlaceModel.longitude), latitudinalMeters: circleRadius, longitudinalMeters: circleRadius))
                        }
                    }
                      }
                
                
                
            }.frame(width: .infinity,height: UIScreen.screenHeight * 0.3).onChange(of: myPlaceModel) { oldValue, newValue in
                    cameraPosition = .region(.init(center: .init(latitude: myPlaceModel.latitude, longitude: myPlaceModel.longitude), latitudinalMeters: circleRadius, longitudinalMeters: circleRadius))
                
            }
            
            
            
        
    }}

#Preview {
    AddNewLocationMapComponent(myPlaceModel: .constant(MyPlaceModel(name: "", latitude: 37.334606, longitude: -122.009102, description: "")), circleRadius: 500)
}
