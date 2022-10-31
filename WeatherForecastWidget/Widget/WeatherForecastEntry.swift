//
//  WeatherForecastEntry.swift
//  WeatherForecastWidgetExtension
//
//  Created by Bruno Bencevic on 25.10.2022..
//

import WidgetKit
import Intents

struct WeatherForeacastEntry: TimelineEntry {
    let date: Date
    let homeData: HomeData
    let settingsData: SettingsData
    let configuration: SelectLocationIntent
    
    static let sample = WeatherForeacastEntry(date: Date(), homeData: .testData, settingsData: .defaultData, configuration: .init())
}

