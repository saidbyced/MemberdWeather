//
//  NetworkManager.swift
//  MemberdWeather
//
//  Created by Christopher Eadie on 10/02/2022.
//

import Foundation

final class NetworkManager<T: Codable> {
    static func fetch(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.other(err: error.localizedDescription)))
            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                completion(.failure(.invalidResponse))
            } else if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let decodedData = try decoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.decodingError(err: error.localizedDescription)))
                }
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse, invalidData
    case decodingError(err: String), other(err: String)
}
