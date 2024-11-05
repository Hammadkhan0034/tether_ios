//
//  RemoteImageView.swift
//  Teatherapp
//
//  Created by Hammad Khan on 04/11/2024.
//

import SwiftUI

struct RemoteImageLoderView: View {
    let image : Image?
    var body : some View{
        
        image?.resizable() ?? Image("defaultImage").resizable()
    }
    
}

struct RemoteImageView: View {
    let url: String
    @State var myImage: Image? = nil
    var body: some View {
        RemoteImageLoderView(image: myImage).onAppear(perform: {
            Task{
                let imageFromServer = await APIManager.shared.downloadImage(urlString: url)
                guard let uiImage = imageFromServer else {return}
                myImage = Image(uiImage: uiImage)
            }
        })
    }
}

#Preview {
    RemoteImageView(url: "")
}
