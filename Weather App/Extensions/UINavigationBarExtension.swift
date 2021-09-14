//
//  UINavigationBarExtension.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import Foundation
import UIKit

extension UINavigationBar {
    public func setVisible(_ visible: Bool) {
        if visible {
            self.setBackgroundImage(nil, for: .default)
            self.shadowImage = nil
            self.isTranslucent = false
        } else {
            self.setBackgroundImage(UIImage(), for: .default)
            self.shadowImage = UIImage()
            self.isTranslucent = true
        }
    }
}
