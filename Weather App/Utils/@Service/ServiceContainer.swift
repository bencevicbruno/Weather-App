//
//  ServiceContainer.swift
//  Weather App
//
//  Created by Bruno Bencevic on 27.10.2022..
//

import Foundation

final class ServiceContainer {
    
    private static var factories: [String: () -> Any] = [:]
    private static var cache: [String: Any] = [:]
    
    static func register<Service>(type: Service.Type, _ factory: @autoclosure @escaping () -> Service) {
        factories[String(describing: type.self)] = factory
    }
    
    static func resolve<Service>(_ resolveType: ServiceType = .automatic, _ type: Service.Type) -> Service? {
        let serviceName = String(describing: type.self)
        
        switch resolveType {
        case .singleton:
            if let service = cache[serviceName] as? Service {
                return service
            } else {
                let service = factories[serviceName]?() as? Service
                
                if let service = service {
                    cache[serviceName] = service
                }
                
                return service
            }
        case .newSingleton:
            let service = factories[serviceName]?() as? Service
            
            if let service = service {
                cache[serviceName] = service
            }
            
            return service
        case .automatic:
            fallthrough
        case .new:
            return factories[serviceName]?() as? Service
        }
    }
}

extension ServiceContainer {
    
    static func setup() {
        ServiceContainer.register(type: DataServiceProtocol.self, DataService())
        ServiceContainer.register(type: PersistenceServiceProtocol.self, PersistenceService())
        ServiceContainer.register(type: LocationServiceProtocol.self, LocationService())
        ServiceContainer.register(type: GeonamesAPIServiceProtocol.self, GeonamesAPIService())
        ServiceContainer.register(type: OpenWeatherAPIServiceProtocol.self, OpenWeatherAPIService())
        ServiceContainer.register(type: LocationNamesServiceProtocol.self, LocationNamesService())
        ServiceContainer.register(type: WeatherServiceProtocol.self, WeatherService())
    }
}
