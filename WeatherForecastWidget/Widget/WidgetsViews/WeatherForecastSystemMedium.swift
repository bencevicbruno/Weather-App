//
//  WeatherForeacastSystemMedium.swift
//  WeatherForecastWidgetExtension
//
//  Created by Bruno Bencevic on 25.10.2022..
//

import SwiftUI
import WidgetKit

struct WeatherForeacastSystemMedium: View {
    
    var entry: WeatherForecastProvider.Entry
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(entry.homeData.cityName)
                        .font(.title)
                    
                    Text(currentTemperature)
                        .font(.body)
                }
                .fontWeight(.medium)
                
                Spacer()
                
                Image(systemName: entry.homeData.condition)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .fontWeight(.bold)
                    .foregroundColor(Color("AccentColor"))
                    .shadow(radius: 8)
            }
            
            Spacer()
            
            HStack {
                HStack {
                    Image("icon_humidity")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    
                    Text(currentHumidity)
                }
                
                HStack {
                    Image("icon_pressure")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    
                    Text(currentPressure)
                }
                .padding(.horizontal, 10)
                
                HStack {
                    Image("icon_wind_speed")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .fontWeight(.bold)
                    
                    Text(currentWindSpeed)
                }
            }
            .font(.callout)
            .fontWeight(.medium)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("image_background")
                .resizable()
                .scaledToFill()
        )
    }
    
    var currentTemperature: String {
        let temperature = String(format: "%.1f", entry.homeData.currentTemperature.convertedToFahrenheit(!entry.settingsData.useCelsius))
        let unit = entry.settingsData.useCelsius ? " °C" : " °F"
        
        return temperature + unit
    }
    
    var currentHumidity: String {
        return String(format: "%.1f", entry.homeData.humidity) + " %"
    }
    
    var currentPressure: String {
        return String(format: "%.1f", entry.homeData.pressure) + " hPA"
    }
    
    var currentWindSpeed: String {
        return String(format: "%.1f", entry.homeData.wind) + " mph"
    }
}

struct WeatherForeacastSystemMedium_Previews: PreviewProvider {
    
    static var previews: some View {
        WeatherForeacastSystemMedium(entry: .sample)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
