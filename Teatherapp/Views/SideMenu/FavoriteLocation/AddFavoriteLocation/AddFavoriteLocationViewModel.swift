//
//  AddFavoriteLocationViewModel.swift
//  Teatherapp
//
//  Created by Hammad Khan on 28/09/2024.
//
import Foundation
class AddFavoriteLocationViewModel: ObservableObject{
    
    @Published var title: String = ""
    @Published var address: String = ""
    @Published var note: String = ""
    @Published var shareWith: Int = 0
    
}
