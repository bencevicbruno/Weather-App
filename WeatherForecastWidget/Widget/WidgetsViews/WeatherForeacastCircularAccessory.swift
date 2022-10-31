//
//  WeatherForeacastCircularAccessory.swift
//  WeatherForecastWidgetExtension
//
//  Created by Bruno Bencevic on 25.10.2022..
//

import SwiftUI
import WidgetKit

struct WeatherForeacastCircularAccessory: View {
    
    var entry: WeatherForecastProvider.Entry
    
    var body: some View {
        VStack {
            Image(systemName: entry.homeData.condition)
                .resizable()
                .scaledToFit()
            
            Text(currentTemperature)
                .minimumScaleFactor(0.75)
                .padding(.bottom)
        }
        .fontWeight(.bold)
    }
    
    var currentTemperature: String {
        let temperature = String(format: "%.1f", entry.homeData.currentTemperature.convertedToFahrenheit(!entry.settingsData.useCelsius))
        let unit = entry.settingsData.useCelsius ? " °C" : " °F"
        
        return temperature + unit
    }
}

struct WeatherForeacastCircularAccessory_Previews: PreviewProvider {
    
    static var previews: some View {
        WeatherForeacastCircularAccessory(entry: .sample)
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
    }
}
