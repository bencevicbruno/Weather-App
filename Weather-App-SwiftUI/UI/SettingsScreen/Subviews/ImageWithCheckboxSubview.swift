import SwiftUI

struct ImageWithCheckboxSubview: View {
    @Binding var isChecked: Bool
    let imageName: String
    var action: ((Bool) -> Void)?
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(imageName)
                .resizable()
                .frame(width: 70, height: 70)
            
            Checkbox($isChecked, action: self.action)
        }
    }

    init(_ binding: Binding<Bool>, imageName: String, action: ((Bool) -> Void)? = nil) {
        self._isChecked = binding
        self.imageName = imageName
        self.action = action
    }
}

struct ImageWithCheckboxSubview_Previews: PreviewProvider {
    static var previews: some View {
        ImageWithCheckboxSubview(.constant(true), imageName: "wind")
            .padding()
            .background(Color.blue)
    }
}
