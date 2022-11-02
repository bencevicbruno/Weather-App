//
//  View+Keyboard.swift
//  Weather App
//
//  Created by Bruno Bencevic on 02.11.2022..
//


import Combine
import SwiftUI

extension View {
    
    fileprivate var keyboardHeightPublished: AnyPublisher<CGFloat, Never> {
        Publishers.Merge(
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillShowNotification)
                .compactMap { $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue }
                .map { $0.cgRectValue.height },
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in CGFloat(0) }
        ).eraseToAnyPublisher()
    }
    
    func readKeyboardHeight(into heightBinding: Binding<CGFloat>) -> some View {
        self.onReceive(keyboardHeightPublished) { height in
            heightBinding.wrappedValue = height
        }
    }
}

