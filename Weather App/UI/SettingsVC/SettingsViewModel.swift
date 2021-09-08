//
//  SettingsViewModel.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

class SettingsViewModel {
    var onCelsiusTapped: ((Bool) -> Void)?
    var onFahrenheitTapped: ((Bool) -> Void)?
    var onHumidityTapped: ((Bool) -> Void)?
    var onPressureTapped: ((Bool) -> Void)?
    var onWindTapped: ((Bool) -> Void)?
    var onExit: EmptyCallback?
}
