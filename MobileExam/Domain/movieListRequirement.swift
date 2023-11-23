//
//  movieListRequirement.swift
//  MobileExam
//
//  Created by user326 on 23/11/23.
//

import Foundation

protocol movieListReqProtocol{
    func getMovieList() async -> Movies?
}

class movieListRequirement: movieListReqProtocol {
    let dataRepository: TMBDRepository

    init(dataRepository: TMBDRepository = TMBDRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getMovieList() async -> Movies? {
            return await dataRepository.getMovieList()
    }
}
