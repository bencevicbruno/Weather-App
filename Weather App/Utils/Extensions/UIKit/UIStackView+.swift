//
//  UIStackView+.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation
import UIKit

extension UIStackView {
    
    func setVisible(_ view: UIView) {
        self.arrangedSubviews.forEach { subview in
            if subview == view {
                subview.isHidden = false
                return
            }
        }
    }
    
    func setHidden(_ view: UIView) {
        self.arrangedSubviews.forEach { subview in
            if subview == view {
                subview.isHidden = true
                return
            }
        }
    }
}
