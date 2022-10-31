import Foundation

extension String {
    func toURLSafe() -> String {
        let replacements = [
            " ": "%20",
            "č": "c",
            "ć": "c",
            "š": "s",
            "ž": "z",
            "đ": "d"
        ]
        
        var string = self
        replacements.forEach {
            string = string.replacingOccurrences(of: $0.key, with: $0.value)
        }
        
        return string
    }
}
