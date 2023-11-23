//
//  TMBD_Repository.swift
//  MobileExam
//
//  Created by user326 on 23/11/23.
//

struct API{
    static let route = "https://api.themoviedb.org/3/movie/popular?api_key=929f5e2df6050431812d85ddde464094"
}

class TMBDRepository: APIProtocol {
    
    func getMovieList() async -> Movies?{
        <#code#>
    }
}
