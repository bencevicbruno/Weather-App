//
//  WeatherForeacastSystemMedium.swift
//  WeatherForecastWidgetExtension
//
//  Created by Bruno Bencevic on 25.10.2022..
//

import SwiftUI
import WidgetKit

struct WeatherForeacastSystemLarge: View {
    
    var entry: WeatherForecastProvider.Entry
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(entry.homeData.cityName)
                        .font(.title)
                    
                    Text(currentTemperature)
                        .font(.body)
                        .fontWeight(.black)
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
            .padding()
            
            Spacer()
            
            HStack(spacing: 30) {
                VStack {
                    Text("Min")
                    
                    Text(minTemperature)
                        .fontWeight(.black)
                }
                
                VStack {
                    Text("Max")
                    
                    Text(maxTemperature)
                        .fontWeight(.black)
                }
            }
            .font(.body)
            .fontWeight(.medium)
            
            Spacer()
            
            Spacer()
            
            HStack(spacing: 0) {
                Spacer()
                
                Link(destination: URL(string: "widget://search")!) {
                    Image("icon_magnifying_glass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .frame(width: 40, height: 40)
                }
                
                Link(destination: URL(string: "widget://settings")!) {
                    Image("icon_gear")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .frame(width: 40, height: 40)
                        .padding(.trailing)
                }
            }
            
            HStack {
                if entry.settingsData.showHumidity {
                    HStack {
                        Image("icon_humidity")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text(currentHumidity)
                    }
                }
                
                if entry.settingsData.showPressure {
                    HStack {
                        Image("icon_pressure")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text(currentPressure)
                    }
                }
                
                if entry.settingsData.showWindSpeed {
                    HStack {
                        Image("icon_wind_speed")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .fontWeight(.bold)
                        
                        Text(currentWindSpeed)
                    }
                }
            }
            .font(.callout)
            .fontWeight(.medium)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 50, alignment: .bottom)
            .background(Color.white.opacity(0.4).clipShape(RoundedRectangle(cornerRadius: 20)))
        }
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
    
    var minTemperature: String {
        let temperature = String(format: "%.1f", entry.homeData.minTemperature.convertedToFahrenheit(!entry.settingsData.useCelsius))
        let unit = entry.settingsData.useCelsius ? " °C" : " °F"
        
        return temperature + unit
    }
    
    var maxTemperature: String {
        let temperature = String(format: "%.1f", entry.homeData.maxTemperature.convertedToFahrenheit(!entry.settingsData.useCelsius))
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

struct WeatherForeacastSystemLarge_Previews: PreviewProvider {
    
    static var previews: some View {
        WeatherForeacastSystemLarge(entry: .sample)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
