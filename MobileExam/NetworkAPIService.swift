//
//  NetworkAPIService.swift
//  MobileExam
//
//  Created by user326 on 23/11/23.
//

import Foundation
import Alamofire

class NetworkAPIService {
    static let shared = NetworkAPIService()
    
    func getMovies(url: URL) async -> Movies?{
        let taskRequest = AF.request(url, method: .get).validate()
        let response = await taskRequest.serializingData().response
        
        switch response.result {
            case .success(let data):
                do{
                    return try JSONDecoder().decode(Movies.self, from: data)
                }
                catch{
                    return nil
                }
            case let .failure(error):
                debugPrint(error.localizedDescription)
                return nil
        }
    }
}
