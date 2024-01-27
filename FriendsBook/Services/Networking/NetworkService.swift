//
//  Project: FriendsBook
//  File: NetworkService.swift
//  Created by: Robert Bikmurzin
//  Date: 27.01.2024
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

final class NetworkService {
    func makeRequest<T: Decodable>(urlString: String,
        completionHandler: @escaping (_ result: Result<T, NetworkError>) -> Void
    ) {
        guard let url =  URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(T.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
