import SwiftUI

struct Checkbox: View {
    @Binding var isChecked: Bool
    var action: ((Bool) -> Void)?
    
    var body: some View {
        ZStack {
            Color.white
            
            if isChecked {
                Image("check")
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(width: 40, height: 40)
        .onTapGesture {
            isChecked.toggle()
            self.action?(self.isChecked)
        }
    }
    
    init(_ binding: Binding<Bool>, action: ((Bool) -> Void)? = nil) {
        self._isChecked = binding
        self.action = action
    }
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        Checkbox(.constant(true))
            .padding()
            .background(Color.blue)
        Checkbox(.constant(false))
            .padding()
            .background(Color.blue)
    }
}
