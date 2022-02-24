//
//  UIViewController.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/14/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showErrorAlert(title: String, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        
        self.present(alert, animated: true)
    }
}
