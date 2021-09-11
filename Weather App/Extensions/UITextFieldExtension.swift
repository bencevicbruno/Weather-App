//
//  UITextFieldExtensions.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/11/21.
//

import Foundation
import UIKit

extension UITextField {
    func setHorizontalPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
