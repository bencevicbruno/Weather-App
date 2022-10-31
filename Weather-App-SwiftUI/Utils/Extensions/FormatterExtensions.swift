import Foundation

extension NumberFormatter {
    static var weatherDataFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ""
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
}
