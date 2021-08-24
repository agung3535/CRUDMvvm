//
//  DetailGame.swift
//  CRUDMvvm
//
//  Created by Putra on 18/08/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailGame: View {
    @ObservedObject var dataApi = ApiService()
    @State var favoritGame = [FavoritModel]()
    @ObservedObject var localStorage = MyLocalStorage()
    var gameId : String
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                VStack(alignment: .leading){
                
//                        Image("atlantica")
//                            .resizable()
//                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: geo.size.height/2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        ZStack(alignment:.topLeading){
//                            VStack(alignment:.leading){
//                                Text("Atlantica Online")
//                                    .font(.system(size:geo.size.width / 30))
//                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                                    .frame(maxWidth: geo.size.width / 1.5, alignment: .leading)
//                                    .foregroundColor(.black)
//                                    .padding(.top,geo.size.height / 60)
//                                    .lineLimit(1)
//                                HStack{
//
//                                        Text("RPG")
//                                            .font(.system(size: geo.size.width / 40))
//                                            .font(.caption)
//                                            .foregroundColor(.white)
//                                            .fontWeight(.bold)
//                                            .padding(.vertical,geo.size.height / 130)
//                                            .padding(.horizontal,geo.size.width / 20)
//                                            .background(Color.gray)
//                                            .clipShape(Capsule())
//
//
//
//                                    Spacer()
//                                }
//                                HStack{
//                                    Image(systemName: "star.fill")
//                                        .resizable()
//                                        .frame(width: geo.size.width/30, height: geo.size.height/60)
//                                        .foregroundColor(.orange)
//                                    Text("4")
//                                        .font(.system(size: geo.size.width / 30))
//                                    Spacer()
//                                }
//                                HStack{
//
//                                        Text("NDoors")
//                                            .font(.footnote)
//                                            .font(.system(size: geo.size.width / 30))
//
//                                }
//
//                                Text("Tampilan")
//                                    .font(.system(size:geo.size.width / 30))
//                                    .fontWeight(.bold)
//                                    .font(.title3)
//                                    .padding(.top,5)
//                                ScrollView(.horizontal){
//                                    HStack{
//                                        ForEach(dataApi.screenShot){ dataSs in
//                                            AnimatedImage(url: URL(string: "\(dataSs.image)"))
//                                                .resizable()
//                                                .scaledToFit()
//                                                .frame(width: geo.size.width / 3, height: geo.size.height / 8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                                        }.onAppear(perform: {
//                                            dataApi.getScreenshot(id: gameId)
//
//                                        })
//                                    }
//                                }
//                                Text("Atlantica adalah game perang turn base untuk menemukan kota altantis yang hilang")
//                                    .font(.caption)
//                                    .padding(.top,5)
//
//                                Spacer()
//                            }
//                            .padding(.horizontal,20)
//                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
//                            .background(CustomShae().fill(Color.white))
//                            .clipShape(Corner())
//
//                            HStack{
//                                Spacer()
//                                Image("xbox")
//                                    .resizable()
//                                    .frame(width: geo.size.width/20, height: geo.size.height/30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                                Image("playstation")
//                                    .resizable()
//                                    .frame(width: geo.size.width/20, height: geo.size.height/30, alignment: .center)
//                                Image("pc")
//                                    .resizable()
//                                    .frame(width: geo.size.width/20, height: geo.size.height/30, alignment: .center)
//                            }.padding()
//                        }
//                        .offset(y: geo.size.height / -15)
//                    VStack{
//                        Button(action: {
//                            self.favoritGame = [FavoritModel(name: "atlantica", image: "atlantica")]
//                            localStorage.setFavorit(dataFavorit: self.favoritGame)
//                        }){
//                            Text("Add to Favorite")
//                                .font(.callout)
//                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: geo.size.width / 2, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .foregroundColor(.white)
//                        .padding(.bottom,geo.size.height / 110)
//                        .padding(.horizontal,geo.size.width / 10)
//                        .background(Color.green)
//                        .clipShape(Capsule())
//                    }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: geo.size.height / 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                    ForEach(dataApi.detailGame){detail in
                        Image(uiImage: "\(detail.backgroundImage)".load())
                            .resizable()
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: geo.size.height/2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        ZStack(alignment:.topLeading){
                            VStack(alignment:.leading){
                                Text("\(detail.name)")
                                    .font(.system(size:geo.size.width / 30))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .frame(maxWidth: geo.size.width / 1.5, alignment: .leading)
                                    .foregroundColor(.black)
                                    .padding(.top,geo.size.height / 60)
                                    .lineLimit(1)
                                HStack{
                                    ForEach(detail.genres){genre in
                                        Text("\(genre.name)")
                                            .font(.system(size: geo.size.width / 40))
                                            .font(.caption)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .padding(.vertical,geo.size.height / 130)
                                            .padding(.horizontal,geo.size.width / 20)
                                            .background(Color.gray)
                                            .clipShape(Capsule())
                                    }


                                    Spacer()
                                }
                                HStack{
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: geo.size.width/30, height: geo.size.height/60)
                                        .foregroundColor(.orange)
                                    Text("".forTrailingZero(temp: detail.rating))
                                        .font(.system(size: geo.size.width / 30))
                                    Spacer()
                                }
                                HStack{
                                    ForEach(detail.developers){devData in
                                        Text("\(devData.name)")
                                            .font(.footnote)
                                            .font(.system(size: geo.size.width / 30))
                                    }
                                }
                                Text("Tampilan")
                                    .font(.system(size:geo.size.width / 30))
                                    .fontWeight(.bold)
                                    .font(.title3)
                                    .padding(.top,5)
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(dataApi.screenShot){ dataScreen in
                                            AnimatedImage(url:URL(string : dataScreen.image))
                                                .resizable()
                                                
                                                .frame(width: geo.size.width / 3, height: geo.size.height / 8)
                                        }
                                    }
                                }
                                Text("\(detail.descriptionRaw)")
                                    .font(.caption)
                                    .padding(.top,5)

                                Spacer()
                            }
                            .padding(.horizontal,20)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                            .background(CustomShae().fill(Color.white))
                            .clipShape(Corner())

                            HStack{
                                Spacer()
                                Image("xbox")
                                    .resizable()
                                    .frame(width: geo.size.width/20, height: geo.size.height/30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Image("playstation")
                                    .resizable()
                                    .frame(width: geo.size.width/20, height: geo.size.height/30, alignment: .center)
                                Image("pc")
                                    .resizable()
                                    .frame(width: geo.size.width/20, height: geo.size.height/30, alignment: .center)
                            }.padding()
                        }
                        .offset(y: geo.size.height / -15)
                        VStack{
                            Button(action: {
                                self.favoritGame = [FavoritModel(name: "atlantica", image: "atlantica")]
                                localStorage.setFavorit(dataFavorit: self.favoritGame)
                            }){
                                Text("Add to Favorite")
                                    .font(.callout)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: geo.size.width / 2, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: geo.size.height/20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .padding(.bottom,geo.size.height / 110)
                            .padding(.horizontal,geo.size.width / 10)
                            .background(Color.green)
                            .clipShape(Capsule())
                        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: geo.size.height / 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    
                    
                }
                .padding(.bottom,geo.size.height/50)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                if(dataApi.loadingDetail){
                    LoadingView()
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
               
            }
            .onAppear(perform: {
                dataApi.getScreenshot(id: gameId)
                dataApi.getGameDetail(id: gameId)
               
            })
        }
    }
}

struct DetailGame_Previews: PreviewProvider {
    static var previews: some View {
        DetailGame(gameId: "id")
    }
}


struct CustomShae : Shape {
    func path(in rect: CGRect) -> Path {
    
        return Path{path in
            path.move(to: CGPoint(x: 0,y:0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
    }
    
    
}


struct Corner : Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
       
        return Path(path.cgPath)
    }
    
    
}
