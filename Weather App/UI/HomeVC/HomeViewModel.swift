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
    
    var updateData: ((SettingsData?) -> Void)?
    var onWeatherDataRecieved: EmptyCallback?
    var onGoToSearchScreen: EmptyCallback?
    var onGoToSettingsScreen: EmptyCallback?
    
    func onFirstAppearance() {
        LocationSerivce.instance.requestLocationData { [weak self] coordinates in
            if let weatherData = WeatherDataService.getWeatherData(from: coordinates) {
                self?.homeData = HomeData(data: weatherData)
                self?.updateData?(nil)
            }
        }
    }
}
