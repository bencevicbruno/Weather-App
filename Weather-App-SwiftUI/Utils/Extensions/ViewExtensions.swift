import SwiftUI

extension View {
    func removeNavigationBar() -> some View {
        return self
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}
