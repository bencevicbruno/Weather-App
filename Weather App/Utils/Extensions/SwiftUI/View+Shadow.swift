//
//  View+Shadow.swift
//  Weather App
//
//  Created by Bruno Bencevic on 28.10.2022..
//

import SwiftUI

extension View {
    
    func addShadow(_ color: Color, size: CGFloat = 8, blurRadius: CGFloat = 16) -> some View {
        self.background(
            color
                .padding(-size)
                .blur(radius: blurRadius)
        )
    }
}
