//
//  TMDB_Models.swift
//  MobileExam
//
//  Created by user326 on 23/11/23.
//

import Foundation

struct Movies{
    var results: [Movie]
}

struct Movie: Identifiable{
    var id: Int
    var overview: String
    var poster_path: String
    var title: String
    var vote_average: String
}
