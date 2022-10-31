//
//  View+Frame.swift
//  Weather App
//
//  Created by Bruno Bencevic on 27.10.2022..
//

import SwiftUI

extension View {
    
    func frame(size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }
}
