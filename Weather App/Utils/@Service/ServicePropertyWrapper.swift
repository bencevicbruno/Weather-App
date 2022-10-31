//
//  ServicePropertyWrapper.swift
//  Weather App
//
//  Created by Bruno Bencevic on 27.10.2022..
//

import Foundation

@propertyWrapper
struct Service<Service> {
    
    var service: Service
    
    init(_ type: ServiceType = .automatic, _ file: String = #file, _ line: Int = #line) {
        guard let service = ServiceContainer.resolve(type, Service.self) else {
            let serviceName = String(describing: Service.self)
            fatalError("No service of type \(serviceName) registered! (\(file)@\(line)")
        }
        
        self.service = service
    }
    
    var wrappedValue: Service {
        get { self.service }
        mutating set { service = newValue }
    }
}
