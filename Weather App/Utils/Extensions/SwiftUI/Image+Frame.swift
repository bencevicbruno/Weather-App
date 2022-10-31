//
//  Image+Frame.swift
//  Weather App
//
//  Created by Bruno Bencevic on 27.10.2022..
//

import SwiftUI

extension Image {
    
    func frameAsIcon(innerSize: CGFloat = 24, outerSize: CGFloat = 40) -> some View {
        self.resizable()
            .scaledToFit()
            .frame(size: innerSize)
            .frame(size: outerSize)
            .contentShape(Rectangle())
    }
}
