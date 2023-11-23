//
//  TMBD_Repository.swift
//  MobileExam
//
//  Created by user326 on 23/11/23.
//
import SwiftUI

struct API{
    static let route = "https://api.themoviedb.org/3/movie/popular?api_key=929f5e2df6050431812d85ddde464094"
}

protocol APIProtocol{
    func getMovieList() async -> Movies?
}

class TMBDRepository: APIProtocol {
    
    let nservice: NetworkAPIService
    init(nservice: NetworkAPIService = NetworkAPIService.shared){
        self.nservice = nservice
    }
    
    func getMovieList() async -> Movies?{
        return await nservice.getMovies(url: URL(string:API.route)!)
    }
}
