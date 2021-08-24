//
//  Extension.swift
//  CRUDMvvm
//
//  Created by Putra on 17/08/21.
//

import Foundation
import SwiftUI


extension String {
        func load() -> UIImage {
            
            do{
                guard let url = URL(string: self) else {
                    return UIImage()
                }
                
                let data: Data = try
                    Data(contentsOf: url)
                
                
                return UIImage(data: data)
                ?? UIImage()
            }catch{
                
            }
            
            return UIImage()
        }
    
    func forTrailingZero(temp: Double) -> String {
        var roundDouble = String(format: "%g", temp)
        return roundDouble
    }
}



