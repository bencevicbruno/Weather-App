//
//  Float+.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation

extension Float {
    
    var convertedToFahrenheit: Float {
        return self * 1.8 + 32
    }
    
    var convertedToCelsius: Float {
        return (self - 32) / 1.8
    }
    
    var rounded: Float {
        (self * 100).rounded() / 100
    }
}
