//
//  HomeViewModel.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import Foundation
import UIKit

class HomeViewModel {
    var cacheService = AppCacheService()
    var homeData: HomeData?
    
    var onFirstAppearance: EmptyCallback?
    var updateData: EmptyCallback?
    var onWeatherDataRecieved: EmptyCallback?
    var onGoToSearchScreen: EmptyCallback?
    var onGoToSettingsScreen: EmptyCallback?
    
    init() {
        homeData = cacheService.cachedHomeData
    }
}
