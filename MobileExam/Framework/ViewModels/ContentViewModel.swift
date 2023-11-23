//
//  ContentViewModel.swift
//  MobileExam
//
//  Created by user326 on 23/11/23.
//

import Foundation

class ContentViewModel: ObservableObject{
    @Published var movieList = [Movie]()
    
    func getMovieList() async{
        let TMBDRepository = TMBDRepository()
        let result = await TMBDRepository.getMovieList()
        
        for i in 0...result!.results.count-1 {
            let movie = result!.results[i]
            let tempMovie = Movie(id: i, overview: movie.overview, poster_path: movie.poster_path, title: movie.title, vote_average: movie.vote_average)
            self.movieList.append(tempMovie)
        }
    }
}


