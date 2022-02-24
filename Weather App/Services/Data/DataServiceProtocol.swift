//
//  DataServiceProtocol.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation

protocol DataServiceProtocol: AnyObject {
    
    func fetchJSON<T>(from url: URL?, completionHandler: @escaping (Result<T, Error>) -> Void) where T: Decodable
}
