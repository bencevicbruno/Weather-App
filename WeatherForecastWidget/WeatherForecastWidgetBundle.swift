//
//  WeatherForecastWidgetBundle.swift
//  WeatherForecastWidget
//
//  Created by Bruno Bencevic on 25.10.2022..
//

import WidgetKit
import SwiftUI

@main
struct WeatherForecastWidgetBundle: WidgetBundle {
    
    init() {
        ServiceContainer.setup()
    }
    
    var body: some Widget {
        WeatherForecastWidget()
        
//        WeatherForecastWidgetLiveActivity()
    }
}
