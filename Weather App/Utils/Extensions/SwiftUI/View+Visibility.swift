//
//  View+Visibility.swift
//  Weather App
//
//  Created by Bruno Bencevic on 31.10.2022..
//

import SwiftUI

extension View {
    
    func isVisible(_ isVisible: Bool) -> some View {
        self.opacity(isVisible ? 1 : 0)
    }
    
    func isHidden(_ isHidden: Bool) -> some View {
        self.opacity(isHidden ? 0 : 1)
    }
}

