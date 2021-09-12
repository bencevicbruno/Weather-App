//
//  GeonamesService.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/11/21.
//

import Foundation

struct GeonamesResponse: Codable {
    let geonames: [City]
    
    struct City: Codable {
        let name: String
    }
}

class GeonamesService {
    static var instance = GeonamesService()
    
    public func getListOfCities(prefixedWith prefix: String) -> [String] {
        var cities = [String]()
        
        let urlSafePrefix = prefix.replacingOccurrences(of: " ", with: "%20")
        
        if let url = URL(string: "http://api.geonames.org/searchJSON?name_startsWith=\(urlSafePrefix)&maxRows=10&username=bencevic_bruno") {
            do {
                let data = try Data(contentsOf: url)
                
                do {
                    let response = try JSONDecoder().decode(GeonamesResponse.self, from: data)
                    response.geonames.forEach {
                        cities.append($0.name)
                    }
                } catch {
                    print("Error parsing data: ", error)
                }
            } catch {
                print("Error fetching data: ", error)
            }
        } else {
            fatalError("Corrupted URL")
        }
       
        cities = Array(Set(cities)).sorted()
        return cities
    }
}
