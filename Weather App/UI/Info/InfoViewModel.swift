//
//  InfoViewModel.swift
//  Weather App
//
//  Created by Bruno Bencevic on 13.10.2022..
//

import Foundation

final class InfoViewModel: ObservableObject {
    
    var onDismissed: (() -> Void)?
    
    init() {
        
    }
    
    func dismissAfter(seconds: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [weak self] in
            self?.onDismissed?()
        }
    }
}
