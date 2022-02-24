//
//  InfoViewModel.swift
//  Weather App
//
//  Created by Bruno Benčević on 24.02.2022..
//

import Foundation
import UIKit

final class InfoViewModel {
    
    var onDismissed: EmptyCallback?
    
    init() {}
    
    func dismiss() {
        onDismissed?()
    }
}
