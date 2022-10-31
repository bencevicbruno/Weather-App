import Foundation

extension DispatchQueue {
    static func runOnMain(_ closure: @escaping () -> Void) {
        Self.main.async {
            closure()
        }
    }
    
    static func runOnMainDelayed(_ delay: Double, _ closure: @escaping () -> Void) {
        Self.main.asyncAfter(deadline: .now() + delay, execute: closure)
    }
    
    static func runInBackground(_ closure: @escaping () -> Void) {
        Self.global(qos: .background).async {
            closure()
        }
    }
    
    static func runInBackgroundDelayed(_ delay: Double, _ closure: @escaping () -> Void) {
        Self.global(qos: .background).asyncAfter(deadline: .now() + delay, execute: closure)
    }
}
