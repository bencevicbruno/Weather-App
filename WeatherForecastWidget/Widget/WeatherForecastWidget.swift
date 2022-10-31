//
//  WeatherForecastWidget.swift
//  WeatherForecastWidget
//
//  Created by Bruno Bencevic on 25.10.2022..
//

import WidgetKit
import SwiftUI
import Intents

struct WeatherForecastWidget: Widget {
    static let displayName = "WeatherApp Forecast"
    static let description = "Provides weather data for current location."
    
    static let kind: String = "WeatherForecastWidget"
    
    static let supportedFamilies: [WidgetFamily] = [
        .systemSmall,
        .systemMedium,
        .systemLarge,
        .systemExtraLarge
    ]
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: Self.kind, intent: SelectLocationIntent.self, provider: WeatherForecastProvider()) { entry in
            WeatherForecastWidgetEntryView(entry: entry)
        }
                            .configurationDisplayName(Self.displayName)
                            .description(Self.description)
                            .supportedFamilies(Self.supportedFamilies)
    }
}
