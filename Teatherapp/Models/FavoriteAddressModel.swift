//
//  FavoriteAddressModel.swift
//  Teatherapp
//
//  Created by Hammad Khan on 19/10/2024.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let favorite = try? JSONDecoder().decode(Favorite.self, from: jsonData)

import Foundation

// MARK: - Favorite
struct FavoriteAddressModel: Codable, Identifiable {
    let id, userID, circleID, title: String
    let address, latitude, longitude, note: String
    let shareWith, createdAt, updatedAt, createdBy: String
    let totalAttachments: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case circleID = "circle_id"
        case title, address, latitude, longitude, note
        case shareWith = "share_with"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case createdBy = "created_by"
        case totalAttachments = "total_attachments"
    }
    
    // Custom initializer from dictionary
        init?(from dict: [String: Any]) {
            guard let id = dict["id"] as? String,
                  let userID = dict["user_id"] as? String,
                  let circleID = dict["circle_id"] as? String,
                  let title = dict["title"] as? String,
                  let address = dict["address"] as? String,
                  let latitude = dict["latitude"] as? String,
                  let longitude = dict["longitude"] as? String,
                  let note = dict["note"] as? String,
                  let shareWith = dict["share_with"] as? String,
                  let createdAt = dict["created_at"] as? String,
                  let updatedAt = dict["updated_at"] as? String,
                  let createdBy = dict["created_by"] as? String,
                  let totalAttachments = dict["total_attachments"] as? String else {
                return nil
            }

            self.id = id
            self.userID = userID
            self.circleID = circleID
            self.title = title
            self.address = address
            self.latitude = latitude
            self.longitude = longitude
            self.note = note
            self.shareWith = shareWith
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.createdBy = createdBy
            self.totalAttachments = totalAttachments
        }

}
