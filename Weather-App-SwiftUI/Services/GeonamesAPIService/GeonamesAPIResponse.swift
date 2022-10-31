import Foundation

struct GeonamesAPIResponse: Codable {
    let geonames: [City]
    
    struct City: Codable {
        let name: String
    }
}
