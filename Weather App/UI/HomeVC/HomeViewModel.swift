//
//  HomeViewModel.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import Foundation
import UIKit

class HomeViewModel {
    let homeData = HomeData.getTest()
    
    var onGoToSearchScreen: EmptyCallback?
    var onGoToSettingsScreen: EmptyCallback?
    var onReturnFromSettingsScreen: ((SettingsData) -> Void)?
}
