//
//  View+SizeReader.swift
//  Weather App
//
//  Created by Bruno Bencevic on 31.10.2022..
//

import SwiftUI

extension View {
    
    func readSize(into sizeBinding: Binding<CGSize>) -> some View {
        self
            .background(
                GeometryReader { geometryProxy in
                    Color.clear
                        .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
                }
            )
            .onPreferenceChange(SizePreferenceKey.self) { size in
                sizeBinding.wrappedValue = size
            }
    }
}

fileprivate struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
