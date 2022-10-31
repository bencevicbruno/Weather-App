//
//  WeatherForeacastRectangularAccessory.swift
//  WeatherForecastWidgetExtension
//
//  Created by Bruno Bencevic on 25.10.2022..
//

import SwiftUI
import WidgetKit

struct WeatherForeacastRectangularAccessory: View {
    
    var entry: WeatherForecastProvider.Entry
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: entry.homeData.condition)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                
                Text(currentTemperature)
            }
            
            Text(entry.homeData.cityName)
        }
        .font(.body)
        .fontWeight(.bold)
    }
    
    var currentTemperature: String {
        let temperature = String(format: "%.1f", entry.homeData.currentTemperature.convertedToFahrenheit(!entry.settingsData.useCelsius))
        let unit = entry.settingsData.useCelsius ? " °C" : " °F"
        
        return temperature + unit
    }
}

struct WeatherForeacastRectangularAccessory_Previews: PreviewProvider {
    
    static var previews: some View {
        WeatherForeacastRectangularAccessory(entry: .sample)
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
