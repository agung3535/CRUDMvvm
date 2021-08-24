//
//  DeveloperModel.swift
//  CRUDMvvm
//
//  Created by Putra on 18/08/21.
//

import Foundation

// MARK: - DeveloperModel
struct DeveloperModel: Codable {
    let count: Int
    let next: String
    let previous: JSONNull?
    let results: [DeveloperResult]
}

// MARK: - Result
struct DeveloperResult: Codable, Identifiable {
    let id: Int
    let name, slug: String
    let gamesCount: Int
    let imageBackground: String
    let games: [Game]

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case games
    }
}

// MARK: - Game
struct Game: Codable {
    let id: Int
    let slug, name: String
    let added: Int
}

// MARK: - Encode/decode helpers


