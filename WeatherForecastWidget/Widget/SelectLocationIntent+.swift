//
//  SelectLocationIntent+.swift
//  WeatherForecastWidgetLocationSelection
//
//  Created by Bruno Bencevic on 26.10.2022..
//

import Foundation

extension SelectLocationIntent {
    
    var settingsData: SettingsData {
        .init(useCelsius: useCelsius != 0,
              showHumidity: showHumidity != 0,
              showPressure: showPressure != 0,
              showWindSpeed: showWindSpeed != 0)
    }
}
