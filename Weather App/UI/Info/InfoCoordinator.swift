//
//  InfoCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 24.02.2022..
//

import Foundation
import UIKit

final class InfoCoordinator: Coordinator {
    
    var onDismissed: EmptyCallback?
    
    func start() -> UIViewController {
        let viewModel = InfoViewModel()
        let viewController = InfoViewController(viewModel: viewModel)
        
        viewModel.onDismissed = { [weak self] in
            self?.onDismissed?()
        }
        
        return viewController
    }
}
