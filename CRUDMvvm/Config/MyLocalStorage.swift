//
//  MyLocalStorage.swift
//  CRUDMvvm
//
//  Created by Putra on 20/08/21.
//

import Foundation

class MyLocalStorage : ObservableObject {
    private static var keyFavorit = "favorit"
    @Published var myFavorit = [FavoritModel]()
    
    func setFavorit(dataFavorit : [FavoritModel]) {
            do{
                let data = try JSONEncoder().encode(dataFavorit)
                UserDefaults.standard.set(data, forKey: MyLocalStorage.keyFavorit)
                print("Berhasil")
            }catch{
                print("fail encode data")
            }
        
    }
    
    
    func getFavorit() -> [FavoritModel]{
        if let data = UserDefaults.standard.data(forKey: MyLocalStorage.keyFavorit) {
            do {
                // Create JSON Decoder
                let favorit = try JSONDecoder().decode([FavoritModel].self, from: data)
                self.myFavorit = favorit

            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        return self.myFavorit
    }
    
}
