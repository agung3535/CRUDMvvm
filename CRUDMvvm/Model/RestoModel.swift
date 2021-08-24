//
//  RestoModel.swift
//  CRUDMvvm
//
//  Created by Putra on 14/08/21.
//

import Foundation
import SwiftUI

struct RestoModel: Codable {
    let status: String
    let data: [RestoResource]

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case data = "Data"
    }
}

// MARK: - Datum
struct RestoResource: Codable {
    let kulinerID: Int
    let nama, thumbnail, alamat, longitude: String
    let latitude, deskripsi, openHour, closeHour: String
    let rating: String

    enum CodingKeys: String, CodingKey {
        case kulinerID = "kuliner_id"
        case nama, thumbnail, alamat, longitude, latitude, deskripsi
        case openHour = "open_hour"
        case closeHour = "close_hour"
        case rating
    }
}
