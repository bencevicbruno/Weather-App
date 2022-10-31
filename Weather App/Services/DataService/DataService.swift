//
//  DataService.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation

final class DataService: DataServiceProtocol {
    
    func fetchJSON<T>(at url: String) async throws -> T where T: Decodable {
        guard let url = URL(string: url) else {
            throw DataServiceError.badURL(url)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        print("[RESPONSE]:")
        print(String(decoding: data, as: UTF8.self))
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func fetchJSON<T>(from url: URL?, completionHandler: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        guard let url = url else {
            return completionHandler(.failure(DataServiceError.badURL("invalid url")))
        }
        
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    DispatchQueue.main.async {
                        completionHandler(.failure(DataServiceError.noInternet))
                    }
                    return
                }
                
                print("Got response: \(String(decoding: data, as: UTF8.self))")
                
                guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
                    DispatchQueue.main.async {
                        completionHandler(.failure(DataServiceError.badJSON))
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    completionHandler(.success(decodedData))
                }
            }
            .resume()
        }
    }
}
