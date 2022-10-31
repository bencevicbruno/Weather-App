import Foundation

extension Int {
    func toFahrenheit() -> Int {
        return Int(Float(self) * 8 / 5 + 32)
    }
}

extension Float {
    func toFahrenheit() -> Float {
        return self * 8 / 5 + 32
    }
}
