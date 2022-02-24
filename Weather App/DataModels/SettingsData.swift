//
//  SettingsData.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation

struct SettingsData: Codable {
    let useCelsius: Bool
    let showHumidity: Bool
    let showPressure: Bool
    let showWindSpeed: Bool
    
    static var defaultData: SettingsData {
        SettingsData(useCelsius: true, showHumidity: true, showPressure: true, showWindSpeed: true)
    }
}
