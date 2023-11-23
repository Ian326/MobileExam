//
//  ContentView.swift
//  MobileExam
//
//  Created by user326 on 22/11/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @State var movieList = [Movie]()
    let API2 = "https://image.tmdb.org/t/p/w500"
    var body: some View {
        List(movieList){
            movie in VStack{
                HStack{
                    Text(movie.title)
                        .font(.title)
                }
                WebImage(url: URL(string: API2+movie.poster_path))
                    .resizable()
                    .scaledToFit()
                HStack{
                    Text("Rating: " + movie.vote_average + "/10")
                        .font(.headline)
                }
                Divider()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let movie1 = Movie(id: 1, overview: "Pelicula1", poster_path: "/vBZ0qvaRxqEhZwl6LWmruJqWE8Z.jpg", title:"Pelicula1", vote_average: "9")
        let movie2 = Movie(id: 2, overview: "Pelicula2", poster_path: "/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg", title:"Pelicula2", vote_average: "9")
        let movie3 = Movie(id: 3, overview: "Pelicula3", poster_path: "/j9mH1pr3IahtraTWxVEMANmPSGR.jpg", title:"Pelicula3", vote_average: "9")
        
        let movieList : [Movie] = [movie1, movie2, movie3]
        
        ContentView(movieList: movieList)
    }
}
