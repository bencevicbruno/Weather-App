//
//  ServiceFactory.swift
//  Weather App
//
//  Created by Bruno Benčević on 24.02.2022..
//

import Foundation

enum ServiceFactory {
    
    static var dataService: DataServiceProtocol {
        DataService()
    }
    
    static var geonamesAPIService: GeonamesAPIServiceProtocol {
        GeonamesAPIService()
    }
    
    static var locationService: LocationServiceProtocol {
        LocationSerivce.instance
    }
    
    static var openWeatherAPIService: OpenWeatherAPIServiceProtocol {
        OpenWeatherAPIService()
    }
    
    static var persistenceService: PersistenceServiceProtocol {
        PersistenceService()
    }
}
