//
//  Array+.swift
//  Weather App
//
//  Created by Bruno Bencevic on 28.10.2022..
//

import Foundation

extension Array where Element: Equatable {
    
    func appendUniqueElements(from other: Array) -> Array {
        var newArray = self
        
        other
            .filter { element in
                !self.contains(where: { $0 == element })
            }
            .forEach {
                newArray.append($0)
            }
        
        return newArray
    }
    
    func prependUniqueElements(from other: Array) -> Array {
        var newArray: [Element] = []
        
        other
            .filter { element in
                !self.contains(where: { $0 == element })
            }
            .forEach {
                newArray.append($0)
            }
        
        newArray.append(contentsOf: self)
        return newArray
    }
}
