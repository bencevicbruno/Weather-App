import Foundation

final class SearchScreenData: ObservableObject {
    @Published var previouslySearchedCities: [String]
    
    init(previouslySearchedCities: [String] = []) {
        self.previouslySearchedCities = previouslySearchedCities
    }
    
    static var defaultValue: SearchScreenData {
        SearchScreenData(previouslySearchedCities: [])
    }
    
    static var sample: SearchScreenData {
        SearchScreenData(previouslySearchedCities: [])
    }
    
    // MARK: Codable
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.previouslySearchedCities = try container.decode([String].self, forKey: .previouslySearchedCities)
    }
}

extension SearchScreenData: Codable {
    enum CodingKeys: CodingKey {
        case previouslySearchedCities
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.previouslySearchedCities, forKey: .previouslySearchedCities)
    }
}
