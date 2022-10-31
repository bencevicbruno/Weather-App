import SwiftUI

struct BackButton: View {
    var action: EmptyCallback?
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            self.action?()
        }, label:  {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .frame(width: 40, height: 40)
                .contentShape(Rectangle())
        })
    }
    
    init(action: EmptyCallback? = nil) {
        self.action = action
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
            .background(Color.blue)
    }
}
