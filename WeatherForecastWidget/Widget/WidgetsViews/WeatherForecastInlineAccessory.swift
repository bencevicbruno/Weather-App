//
//  WeatherForeacastInlineAccessory.swift
//  WeatherForecastWidgetExtension
//
//  Created by Bruno Bencevic on 25.10.2022..
//

import SwiftUI
import WidgetKit

struct WeatherForeacastInlineAccessory: View {
    
    var entry: WeatherForecastProvider.Entry
    
    var body: some View {
        HStack {
            Image(systemName: entry.homeData.condition)
                .resizable()
                .scaledToFit()
            
            Text(currentTemperature)
        }
        .fontWeight(.bold)
    }
    
    var currentTemperature: String {
        let temperature = String(format: "%.1f", entry.homeData.currentTemperature.convertedToFahrenheit(!entry.settingsData.useCelsius))
        let unit = entry.settingsData.useCelsius ? " °C" : " °F"
        
        return temperature + unit
    }
}

struct WeatherForeacastInlineAccessory_Previews: PreviewProvider {
    
    static var previews: some View {
        WeatherForeacastInlineAccessory(entry: .sample)
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
    }
}
