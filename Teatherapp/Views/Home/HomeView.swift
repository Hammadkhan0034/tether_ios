//
//  HomeView.swift
//  Teatherapp
//
//  Created by AbdulWahabTanveer on 04/09/2023.
//

import SwiftUI
import GoogleMaps

struct UserLocation {
    var position: CLLocationCoordinate2D
    var image: Image
}

struct HomeView: View {
    
    @EnvironmentObject var tfModel: TFBottomBarModel
    
    @StateObject var viewModel =  UsersLocationViewModel()
    @State var userLocations: [UserLocation] = []
    
    var body: some View {
        VStack{
            DashboardMap(userLocations: self.$userLocations)
                .environmentObject(tfModel)
            
            TFBottomBar()
                .environmentObject(tfModel)
                .ignoresSafeArea()
        }
        .overlay(self.viewModel.isLoading ? LoadingView(): nil)
        .onAppear{
            viewModel.getLocations(
                userName: UserDefaults.standard.string(forKey: "username") ?? "",
                temporaryAccessCode: UserDefaults.standard.string(forKey: "temporaryAccessCode") ?? "",
                userID: UserDefaults.standard.string(forKey: "userID") ?? "",
                circleID: UserDefaults.standard.string(forKey: "circleID") ?? ""
            )
        }
        .onChange(of: viewModel.apiSuccessFullyCalled) { newValue in
            DispatchQueue.main.async {
                if let membersArray = viewModel.usersLocationModel?.data.circles.first?.members {
                    userLocations.removeAll()
                    for member in membersArray {
                        self.userLocations.append(UserLocation(position: CLLocationCoordinate2D(latitude: Double("\(member.latitude)") ?? 0.0,
                                                                                                longitude: Double("\(member.longitude)") ?? 0.0),
                                                               image: getImageByName(member.userImage)))
                        
                    }
                }
            }
        }
    }

    func getImageByName(_ imageName: String) -> Image {
        let string = imageName.dropFirst()
        let completeURL = "https://tether.mydispatchapp.com/V2/services\(string)"

        // Try loading the image from the URL
        if let url = URL(string: completeURL), let imageData = try? Data(contentsOf: url),
           let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage)
        } else {
            // If loading from URL fails, try loading a system image
            if let systemImage = UIImage(systemName: imageName) {
                return Image(uiImage: systemImage)
            } else {
                // If it's not a system image, assume it's a custom image in your asset catalog
                if let customImage = UIImage(named: imageName) {
                    return Image(uiImage: customImage)
                } else {
                    // If the image name is not valid, return a default placeholder image or handle it accordingly
                    return Image(systemName: "questionmark.circle")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
