//
//  WeatherForeacastSystemSmall.swift
//  WeatherForecastWidgetExtension
//
//  Created by Bruno Bencevic on 25.10.2022..
//

import SwiftUI
import WidgetKit

struct WeatherForeacastSystemSmall: View {
    
    var entry: WeatherForecastProvider.Entry
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Spacer()
                
                Text(currentTemperature)
                    .font(.caption)
                
                Text(entry.homeData.cityName)
                    .font(.title3)
            }
            .fontWeight(.medium)
            .foregroundColor(.white)
            
            VStack {
                Image(systemName: entry.homeData.condition)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .fontWeight(.bold)
                    .foregroundColor(Color("AccentColor"))
                    .shadow(radius: 8)
                
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("image_background")
                .resizable()
                .scaledToFill()
                .overlay {
                    LinearGradient(colors: [.black.opacity(0.5), .clear, .clear], startPoint: .bottom, endPoint: .top)
                }
        )
        .unredacted()
    }
    
    var currentTemperature: String {
        let temperature = String(format: "%.1f", entry.homeData.currentTemperature.convertedToFahrenheit(!entry.settingsData.useCelsius))
        let unit = entry.settingsData.useCelsius ? " °C" : " °F"
        
        return temperature + unit
    }
}

struct WeatherForeacastSystemSmal_Previews: PreviewProvider {
    
    static var previews: some View {
        WeatherForeacastSystemSmall(entry: .sample)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
