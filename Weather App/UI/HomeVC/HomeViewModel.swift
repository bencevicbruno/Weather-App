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
    
    var onFirstAppearance: EmptyCallback?
    var updateData: EmptyCallback?
    var onWeatherDataRecieved: EmptyCallback?
    var onGoToSearchScreen: EmptyCallback?
    var onGoToSettingsScreen: EmptyCallback?
}
