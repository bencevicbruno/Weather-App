//
//  InfoCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 24.02.2022..
//

import SwiftUI

final class InfoCoordinator: Coordinator {
    
    var onDismissed: EmptyCallback?
    
    func start() -> UIViewController {
        let vm = InfoViewModel()
        let vc = UIHostingController(rootView: InfoView(viewModel: vm))
        
        vm.onDismissed = { [weak self] in
            self?.onDismissed?()
        }
        
        return vc
    }
}
