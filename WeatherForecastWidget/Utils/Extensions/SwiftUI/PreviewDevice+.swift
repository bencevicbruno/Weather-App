//
//  PreviewDevice+.swift
//  Weather App
//
//  Created by Bruno Bencevic on 26.10.2022..
//

import SwiftUI

extension PreviewDevice {
    
    static let iPhone11 = PreviewDevice(rawValue: "iPhone 11")
    static let iPhone12 = PreviewDevice(rawValue: "iPhone 12")
    static let iPhone13 = PreviewDevice(rawValue: "iPhone 13")
    static let iPhone14 = PreviewDevice(rawValue: "iPhone 14")
    static let iPhone14Pro = PreviewDevice(rawValue: "iPhone 14 Pro")
}

extension View {
    
    func previewMultipleDevices(_ devices: [PreviewDevice]) -> some View {
        ForEach(devices, id: \.rawValue) { device in
            self
                .previewDevice(device)
        }
    }
}
