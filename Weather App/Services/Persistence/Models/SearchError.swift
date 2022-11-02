//
//  SearchError.swift
//  Weather App
//
//  Created by Bruno Bencevic on 27.10.2022..
//

import Foundation

struct SearchError: Equatable, Identifiable {
    let id: UUID
    let systemImageName: String
    let title: String
    let description: String
    let detailedDescription: String?
    
    init(id: UUID? = nil, systemImageName: String, title: String, description: String, detailedDescription: String? = nil) {
        self.id = id ?? UUID()
        self.systemImageName = systemImageName
        self.title = title
        self.description = description
        self.detailedDescription = detailedDescription
    }
}

extension SearchError {
    
    static var previewSample: SearchError {
        .init(id: UUID(),
              systemImageName: "antenna.radiowaves.left.and.right.slash",
              title: "Error",
              description: "There was an error connecting to openweatherapi.com",
              detailedDescription: "The network request failed due to wrong HTTP method type. Only GET method is supported. Please contact the developers to fix this.")
    }
    
    static let empty = SearchError(
        id: UUID(),
        systemImageName: "globe.europe.africa.fill",
        title: "Guess what...",
        description: "No locations were found. Are you sure it's on earth?")
}
