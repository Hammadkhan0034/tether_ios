//
//  MyPlaceModel.swift
//  Teatherapp
//
//  Created by Hammad Khan on 17/10/2024.
//
import Foundation
struct MyPlaceModel: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var latitude: Double
    var longitude: Double
    var description: String?
    
    static func == (lhs: MyPlaceModel, rhs: MyPlaceModel) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }

}
