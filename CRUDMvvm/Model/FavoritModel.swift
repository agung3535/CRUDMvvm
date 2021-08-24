//
//  FavoritModel.swift
//  CRUDMvvm
//
//  Created by Putra on 20/08/21.
//

import Foundation


struct FavoritModel : Codable, Identifiable {
    var id = UUID()
    var name : String
    var image : String
    
}
