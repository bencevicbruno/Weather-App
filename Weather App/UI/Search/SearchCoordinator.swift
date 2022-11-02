//
//  SearchCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit
import SwiftUI

final class SearchCoordinator: Coordinator {
    
    var onDismissed: EmptyCallback!
    
    func start() -> UIViewController {
        let viewModel = SearchViewModel()
        let viewController = UIHostingController(rootView: SearchView(viewModel: viewModel))
        
        viewModel.onDismissed = { [weak self] in
            self?.onDismissed()
        }
        
        return viewController
    }
}
