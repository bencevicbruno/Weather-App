import Foundation

extension UserDefaults {
    func load<T: Decodable>(_ type: T.Type, key: String, defaultValue: T, onFailure: FailureHandler? = nil) -> T {
        guard let data = self.data(forKey: key) else {
            onFailure?(Failure(error: "Error loading \(key)", message: "\(key) doesn't exist."))
            return defaultValue
        }
        
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch {
            onFailure?(Failure(error: "Error decoding \(key)", message: error.localizedDescription))
            return defaultValue
        }
    }
    
    func save<T: Encodable>(_ type: T, key: String, onFailure: FailureHandler? = nil) {
        do {
            let data = try JSONEncoder().encode(type)
            self.set(data, forKey: key)
        } catch {
            onFailure?(Failure(error: "Error encoding \(key)", message: error.localizedDescription))
        }
    }
}
