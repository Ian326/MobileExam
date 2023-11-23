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
    
    private let apiKey = "929f5e2df6050431812d85ddde464094"
    
    func getMovies(url: URL) async -> Movies?{
        var headers: HTTPHeaders = [:]
        headers["Authorization"] = "Bearer \(apiKey)"
        let taskRequest = AF.request(url, method: .get, headers: headers).validate()
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
