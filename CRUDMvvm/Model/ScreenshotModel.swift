//
//  ScreenshotModel.swift
//  CRUDMvvm
//
//  Created by Putra on 20/08/21.
//

import Foundation


// MARK: - ScreenshotModel
struct ScreenshotModel: Codable {
    let count: Int
    let next, previous: JSONNull?
    let results: [ScreenSResult]
}

// MARK: - Result
struct ScreenSResult: Codable, Identifiable {
    let id: Int
    let image: String
    let width, height: Int
    let isDeleted: Bool

    enum CodingKeys: String, CodingKey {
        case id, image, width, height
        case isDeleted = "is_deleted"
    }
}
