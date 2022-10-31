//
//  UIScreen+.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation
import UIKit

extension UIScreen {
    
    var isSmall: Bool {
        self.bounds.size.width <= 320
    }
    
    var topUnsafePadding: CGFloat {
        UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
    }
    
    var bottomUnsafePadding: CGFloat {
        UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
    }
}
