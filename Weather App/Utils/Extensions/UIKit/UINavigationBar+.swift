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
        self.setBackgroundImage(visible ? nil : UIImage(), for: .default)
        self.shadowImage = visible ? nil : UIImage()
        self.isTranslucent = !visible
    }
}
