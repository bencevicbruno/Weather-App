//
//  SearchCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

final class SearchCoordinator: Coordinator {
    
    var onDismissed: ((String?) -> Void)?
    
    func start() -> UIViewController {
        let viewModel = SearchViewModel(persistenceService: ServiceFactory.persistenceService, geonamesService: ServiceFactory.geonamesAPIService)
        let viewController = SearchViewController(viewModel: viewModel)
        
        viewModel.onDismissed = { [weak self] selectedLocation in
            self?.onDismissed?(selectedLocation)
        }
        
        return viewController
    }
}
