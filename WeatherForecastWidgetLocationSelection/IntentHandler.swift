//
//  IntentHandler.swift
//  WeatherForecastWidgetLocationSelection
//
//  Created by Bruno Bencevic on 26.10.2022..
//

import Intents

class IntentHandler: INExtension, SelectLocationIntentHandling {
    
    func resolveUseCelsius(for intent: SelectLocationIntent, with completion: @escaping (INBooleanResolutionResult) -> Void) {
        @Service var persistenceService: PersistenceServiceProtocol
        completion(.success(with: !persistenceService.settingsData.useCelsius))
    }
    
    
    func resolveLocationType(for intent: SelectLocationIntent, with completion: @escaping (LocationTypeResolutionResult) -> Void) {
        completion(.success(with: intent.locationType))
    }
    
//    func resolveLocationType(for intent: SelectLocationIntent) async -> LocationTypeResolutionResult {
//        return .success(with: intent.locationType)
//    }
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}
