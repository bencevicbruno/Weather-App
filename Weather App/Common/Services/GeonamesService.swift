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
    func getListOfCities(prefixedWith prefix: String, errorNotifier: ((String, String?) -> Void)? = nil) -> [String] {
        var cities = [String]()
        
        let urlSafePrefix = prefix.lowercased().toURLSafe()
        
        if let url = URL(string: "http://api.geonames.org/searchJSON?name_startsWith=\(urlSafePrefix)&maxRows=10&username=bencevic_bruno") {
            do {
                let data = try Data(contentsOf: url)
                
                do {
                    let response = try JSONDecoder().decode(GeonamesResponse.self, from: data)
                    response.geonames.forEach {
                        cities.append($0.name)
                    }
                } catch {
                    errorNotifier?("Error parsing data", error.localizedDescription)
                }
            } catch {
                errorNotifier?("Error fetching data", error.localizedDescription)
            }
        } else {
            errorNotifier?("Invalid city name", "Make sure your city name doesn")
        }
       
        cities = Array(Set(cities)).sorted()
        return cities
    }
}
