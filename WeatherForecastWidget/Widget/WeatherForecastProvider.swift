//
//  WeatherForecastProvider.swift
//  WeatherForecastWidgetExtension
//
//  Created by Bruno Bencevic on 25.10.2022..
//

import WidgetKit
import SwiftUI
import Intents

struct WeatherForecastProvider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> WeatherForeacastEntry {
        .sample
    }

    func getSnapshot(for configuration: SelectLocationIntent, in context: Context, completion: @escaping (WeatherForeacastEntry) -> ()) {
        print(configuration.settingsData)
        if context.isPreview {
            print("Getting snapshot for preview")
            completion(.sample)
            return
        }
        print("Getting snapshot")
        
        @Service var persistenceService: PersistenceServiceProtocol
        
        if configuration.locationType == .appLocation {
            print("Config: appLocation")
            if let homeData = persistenceService.homeData {
                print("Found home data")
                completion(.init(date: Date(), homeData: homeData, settingsData: configuration.settingsData, configuration: configuration))
            } else {
                print("No home data found...")
            }
        } else {
            print("Config: not appLocation")
            completion(.init(date: Date(), homeData: .testData, settingsData: .defaultData, configuration: configuration))
        }
    }

    func getTimeline(for configuration: SelectLocationIntent, in context: Context, completion: @escaping (Timeline<WeatherForeacastEntry>) -> ()) {
        print(configuration.settingsData)
        print("Getting timeline entry")
        if configuration.locationType == .userLocation {
            Task {
                @Service var persistenceService: PersistenceServiceProtocol
                @Service var weatherService: WeatherServiceProtocol
                
                do {
                    let weatherData = try await weatherService.fetchWeatherData(for: (persistenceService.deviceLocation[0], persistenceService.deviceLocation[1]))
                    
                    completion(.init(entries: [.init(date: Date(), homeData: weatherData, settingsData: configuration.settingsData, configuration: .init())], policy: .atEnd))
                } catch {
                    print(error)
                }
            }
        } else { // if configuration.locationType == .appLocation {
            print("Config: appLocation")
            @Service var persistenceService: PersistenceServiceProtocol
            if let homeData = persistenceService.homeData {
                print("Found home data")
                completion(.init(entries: [.init(date: Date(), homeData: homeData, settingsData: configuration.settingsData, configuration: .init())], policy: .atEnd))
            } else {
                print("No home data found...")
            }
        }
    }
}
