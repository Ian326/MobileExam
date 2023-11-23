//
//  ContentViewModel.swift
//  MobileExam
//
//  Created by user326 on 23/11/23.
//

import Foundation
import Alamofire

class movieListReq {
    static let shared = movieListRequirement()
}

class ContentViewModel: ObservableObject{
    @Published var movieList = [Movie]()
    
    var movieListRequirement: movieListReqProtocol

    init(movieListRequirement: movieListReqProtocol = movieListReq.shared) {
        self.movieListRequirement = movieListRequirement
    }
    
    @MainActor
    func getMovieList() async{
        
        let result = await movieListRequirement.getMovieList()
        
        for i in 0...result!.results.count-1 {
            let movie = result!.results[i]
            let tempMovie = Movie(id: i, overview: movie.overview, poster_path: movie.poster_path, title: movie.title, vote_average: movie.vote_average)
            self.movieList.append(tempMovie)
        }
    }
}


