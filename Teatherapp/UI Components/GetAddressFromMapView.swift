import SwiftUI
import MapKit

// Custom struct to conform to Equatable
struct EquatableCoordinateRegion: Equatable {
    var center: CLLocationCoordinate2D
    var span: MKCoordinateSpan
    
    // Create an MKCoordinateRegion from this struct
    var mkCoordinateRegion: MKCoordinateRegion {
        MKCoordinateRegion(center: center, span: span)
    }
    
    static func == (lhs: EquatableCoordinateRegion, rhs: EquatableCoordinateRegion) -> Bool {
        return lhs.center.latitude == rhs.center.latitude &&
               lhs.center.longitude == rhs.center.longitude &&
               lhs.span.latitudeDelta == rhs.span.latitudeDelta &&
               lhs.span.longitudeDelta == rhs.span.longitudeDelta
    }
}

struct GetAddressFromMapView: View {
    @State private var region = EquatableCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State var myPlaceModel: MyPlaceModel
    @State private var myPlaceModelLocal: MyPlaceModel = MyPlaceModel(name: "", latitude: 0, longitude: 0, description: "")
    @Binding var isActive: Bool
    @State var isLoading = false
    
    var body: some View {
        ZStack{

            VStack {
                Map(coordinateRegion: Binding(
                    get: { region.mkCoordinateRegion },
                    set: { newRegion in
                        // Update the state with the new region'
                        myPlaceModelLocal.latitude = newRegion.center.latitude
                        myPlaceModelLocal.longitude = newRegion.center.longitude
                        region = EquatableCoordinateRegion(center: newRegion.center, span: newRegion.span)
                        print("Center Latitude: \(newRegion.center.latitude), Longitude: \(newRegion.center.longitude)")
                    }
                )).overlay(alignment: .top, content: {
                    SimpleTextField(placeHolder: "Select An Address", inputField: $myPlaceModelLocal.name).padding(.all)
//                    Text(myPlaceModel.name)
                }) .onChange(of: region) {  value in
                    Task{
                        if(isLoading){return}
                        isLoading = true
                       await  fetchLocationNameAndDescription(for: CLLocationCoordinate2D(latitude: myPlaceModel.latitude, longitude: myPlaceModel.longitude))
                        isLoading = false
                    }
                }
                
                HStack{
                    TFButton(label: "Close", onClick: {isActive = false})
                    TFButton(label: "Select", onClick: {
                        myPlaceModel = myPlaceModelLocal
                        isActive = false
                    })
                }.padding()
            }
            Image(systemName: "mappin").resizable().frame(width: 20,height: 30).foregroundStyle(.appBlue)

        }.frame(width: UIScreen.screenWidth * 0.9, height: UIScreen.screenHeight * 0.8).fixedSize().background(.white).shadow(radius: 10)
        
    }
     func fetchLocationNameAndDescription(for coordinate: CLLocationCoordinate2D) async {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        do {
            let placemarks = try await geocoder.reverseGeocodeLocation(location)
            guard let placemark = placemarks.first else {
                print("No placemarks found.")
                return
            }
            
            // Extract the location name and description
            myPlaceModel.name = placemark.name ?? "Unknown Location"
            myPlaceModel.description = [
                placemark.locality,
                placemark.administrativeArea,
                placemark.country
            ].compactMap { $0 }.joined(separator: ", ")
        } catch {
            print("Reverse geocoding failed with error: \(error.localizedDescription)")
        }
    }
    
}
//#Preview {
//    GetAddressFromMapView(myPlaceModel: B, isActive: .constant(false))
//}
