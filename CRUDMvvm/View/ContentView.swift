//
//  ContentView.swift
//  CRUDMvvm
//
//  Created by Putra on 14/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var dataApi = ApiService()
    @State var gameData = [Result]()
    @State var dev = [DeveloperResult]()
    var body: some View {
        NavigationView{
            ZStack{
                VStack(alignment:.leading){
                    GeometryReader{ geo in
                        ZStack{
                            VStack(alignment:.leading){
                                TextTitle(title: "Developer")
                                if(dataApi.loadingDeveloper){
                                    LoadingView()
                                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: geo.size.width / 1, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: geo.size.height / 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(self.dev){ dataDev in
                                            ZStack(alignment: .bottomLeading){
                                                Image(uiImage: "\(dataDev.imageBackground)".load())
                                                    .resizable()
                                                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: geo.size.width / 1.2, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: geo.size.height / 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                
                                                ContainerRelativeShape()
                                                    .frame(width: geo.size.width / 1.2, height: geo.size.width / 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                    .opacity(0.4)

                                                Text("\(dataDev.name)")
                                                    .foregroundColor(.white)
                                                    .font(.callout)
                                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
                                            }
                                            .cornerRadius(20)
                                            .padding(.leading,5)
                                        }
                                    }
                                    
                                }.onAppear(perform: {
                                    dataApi.getDeveloper{data in
                                        self.dev = data
                                    }
                                })
                                TextTitle(title: "Game List")
                                if(dataApi.loadingGame){
                                    LoadingView()
                                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: geo.size.width / 1, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: geo.size.height / 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }

                                GridGame(gameData: self.gameData)
                                    .onAppear(perform: {
                                        dataApi.getGame{data in
                                            self.gameData = data
                                        }
                                    })
                                Spacer()
                            }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            
                            
                        }
                    }
                }
                
                .navigationBarHidden(true)
                .navigationBarTitle(Text("Home"))
                
            }
            
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextTitle : View {
    @State var title : String
    var body: some View{
        Text(title)
            .padding(.leading,5)
    }
}

struct GridGame : View {
    var gameData : [Result]
    let columns = Array(repeating: GridItem(.flexible(), spacing: 6, alignment: .center), count: 2)
    var body: some View {
            GeometryReader{ geo in
                ScrollView(.vertical){
                    LazyVGrid(columns: columns, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 6, pinnedViews: /*@START_MENU_TOKEN@*/[]/*@END_MENU_TOKEN@*/, content: {
                        ForEach(gameData){ dataGame in
                            NavigationLink(destination: DetailGame(gameId:String(dataGame.id))){
                                GameItem(data: dataGame, width: geo.size.width, heigt: geo.size.height)
                            }

                        }
                    })
                }
            }
        
    }
    
}

struct GameItem : View {
    var data : Result
    var width: CGFloat
    var heigt: CGFloat
    var body: some View{
        ZStack{
            VStack(alignment:.leading){
                Image(uiImage: "\(data.backgroundImage)".load())
                    .resizable()
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: width * 1, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: width * 0.5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("\(data.name)")
                    .foregroundColor(.black)
                    .font(.callout)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .lineLimit(1)
                HStack{
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(.orange)
                    Text("".forTrailingZero(temp: data.rating))
                        .foregroundColor(.gray)
                        .font(.system(size:12))
                        .fontWeight(.bold)
                    
                }.padding(EdgeInsets(top: 1, leading: 10, bottom: 0, trailing: 10))
                Text("Date Release: \(data.released)")
                    .foregroundColor(.gray)
                    .font(.system(size:12))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10))
                
            }
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 0.4)
                        .foregroundColor(.gray)
                    )
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
    }
}



