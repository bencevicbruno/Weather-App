import Foundation
import SwiftUI

extension Binding where Value == Bool {
    var opposite: Binding<Value> {
        Binding<Value>(
            get: {
                return !self.wrappedValue
            }, set: {
                self.wrappedValue = !$0
            }
        )
    }
}
