//
//  ApiService.swift
//  CRUDMvvm
//
//  Created by Putra on 16/08/21.
//

import Foundation


class ApiService: ObservableObject {
    
    let baseUrl = "https://api.rawg.io/api/"
    let apiKey = "fa735ed2b5864b30978f9f68dc9790b5"
    
    @Published var gameData = [Result]()
    @Published var devData = [DeveloperResult]()
    @Published var detailGame = [DetailGameResc]()
    @Published var myFavorit = [FavoritModel]()
    @Published var screenShot = [ScreenSResult]()
    @Published var loadingDeveloper = true
    @Published var loadingGame = true
    @Published var isErrorHome = false
    @Published var loadingSS = true
    @Published var loadingDetail = true
    
   
    
    func getGame(completion : @escaping ([Result]) -> ()) {
        self.loadingGame = true
        DispatchQueue.global(qos: .utility).async {
            guard let url = URL(string: "\(self.baseUrl)games?key=\(self.apiKey)") else {
                fatalError("INVALID URL")
            }
            print(url)
            
            URLSession.shared.dataTask(with: url){(data,response,error) in
                guard let resData = data, error == nil else{
                    print(error)
                    return
                }
                do{
                    let json = try JSONDecoder().decode(GameModel.self, from: resData)
                    DispatchQueue.main.async {
                        self.loadingGame = false
                        print(json.results)
                        completion(json.results)
                        
                       
                    }
                    return
                   
                }catch{
                    print(error)
                }
                
            }.resume()
        }
        
    }
    
    func getDeveloper(completion: @escaping ([DeveloperResult]) -> ()) {
        self.loadingDeveloper = true
        DispatchQueue.global(qos: .utility).async {
            guard let url = URL(string: "\(self.baseUrl)developers?key=\(self.apiKey)") else {
                fatalError("INVALID URL")
            }
            
            URLSession.shared.dataTask(with: url){(data,response,error) in
                guard let resData = data, error == nil else{
                    print(error)
                    return
                }
                do{
                    let json = try JSONDecoder().decode(DeveloperModel.self, from: resData)
                    print("data dev udah selesai = \(json.results.count)")
                    DispatchQueue.main.async {
                        self.loadingDeveloper = false
                        print(json.results)
                        completion(json.results)
                        
                       
                    }
                    return
                }catch{
                    print("Decode Json fail")
                }
                
            }.resume()
        }
        
    }
    

    
    func getGameDetail(id : String) {
        
        guard let url = URL(string: "\(self.baseUrl)games/\(id)?key=\(apiKey)") else {
            fatalError("INVALID URL")
        }
        
        URLSession.shared.dataTask(with: url){(data,response,error) in
            guard let resData = data, error == nil else{
                print(error)
                return
            }
            do{
                let json = try JSONDecoder().decode(DetailGameResc.self, from: resData)
                DispatchQueue.main.async {
                    self.loadingDetail = false
                    self.detailGame = [json]
                   
                }
            }catch{
                print(error)
            }
        }.resume()
    }
    
    func getScreenshot(id : String) {
        guard let url = URL(string: "\(self.baseUrl)games/\(id)/screenshots?key=\(apiKey)") else{
            fatalError("INVALID URL")
        }

        URLSession.shared.dataTask(with: url){(data,response,error) in
            print("masul url session")
            guard let resData = data, error == nil else {
                print(error)
                return
            }
            
            do{
                let json = try JSONDecoder().decode(ScreenshotModel.self, from: resData)
                DispatchQueue.global().async {
                  
                    self.getSSDone(data: json.results)
                }
            }catch{
        
                print(error)
            }
        }.resume()
    
    }
    
    func updateGame(data : [Result]) {
        DispatchQueue.main.async {
            self.gameData = data
            self.loadingGame = false
        }
    }
    
    func updateDeveloper(data : [DeveloperResult]) {
        DispatchQueue.main.async {
            
            self.devData = data
            self.loadingDeveloper = false
        }
    }
    
    func getSSDone(data : [ScreenSResult]) {
        DispatchQueue.main.async {
            self.loadingSS = false
            self.screenShot = data
        }
    }
    
    func getError(isError : Bool){
        self.isErrorHome = true
    }
    
    
    
}
