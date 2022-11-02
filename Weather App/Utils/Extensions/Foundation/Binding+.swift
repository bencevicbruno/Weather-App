//
//  Binding+.swift
//  Weather App
//
//  Created by Bruno Bencevic on 31.10.2022..
//

import SwiftUI

extension Binding where Value == Bool {
    
    init<T>(asBool binding: Binding<T?>) {
        self.init(get: {
            binding.wrappedValue != nil
        }, set: { value in
            if !value {
                binding.wrappedValue = nil
            }
        })
    }
}
