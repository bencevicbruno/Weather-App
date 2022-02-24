//
//  StringExtensions.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/14/21.
//

import Foundation

extension String {
    
    var urlSafe: String? {
        self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}
