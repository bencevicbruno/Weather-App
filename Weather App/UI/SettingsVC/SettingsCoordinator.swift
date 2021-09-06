//
//  SettingsCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

class SettingsCoordinator: Coordinator {
    
    func start() -> UIViewController {
        let vc = createSettingsVC()
        
        return vc
    }
    
    private func createSettingsVC() -> UIViewController {
        let vc = SettingsViewController()
        vc.viewModel = SettingsViewModel()
        
        //TODO: setup viewModel
        
        return vc
    }
    
}
