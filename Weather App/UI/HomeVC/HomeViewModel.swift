//
//  HomeViewModel.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import Foundation
import UIKit

class HomeViewModel {
    var homeData = AppCacheService.instance.cachedHomeData
    
    var updateData: EmptyCallback?
    var onWeatherDataRecieved: EmptyCallback?
    var onGoToSearchScreen: EmptyCallback?
    var onGoToSettingsScreen: EmptyCallback?
    
    func onFirstAppearance() {
        self.updateData?()
        
        LocationSerivce.instance.requestLocationData(thenRun: { [weak self] coordinates in
            if let weatherData = OpenWeatherAPIService.instance.getWeatherData(from: coordinates) {
                self?.homeData = HomeData(data: weatherData)
                self?.updateData?()
            }
        })
    }
}
