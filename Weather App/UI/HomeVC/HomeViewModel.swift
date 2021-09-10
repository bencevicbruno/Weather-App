//
//  HomeViewModel.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import Foundation
import UIKit

class HomeViewModel {
    var homeData: HomeData?
    
    var updateData: EmptyCallback?
    var onWeatherDataRecieved: EmptyCallback?
    var onGoToSearchScreen: EmptyCallback?
    var onGoToSettingsScreen: EmptyCallback?
    
    func onFirstAppearance() {
        LocationSerivce.instance.requestLocationData(thenRun: { [weak self] coordinates in
            if let weatherData = WeatherDataService.instance.getWeatherData(from: coordinates) {
                self?.homeData = HomeData(data: weatherData)
                self?.updateData?()
            }
        }) 
    }
}
