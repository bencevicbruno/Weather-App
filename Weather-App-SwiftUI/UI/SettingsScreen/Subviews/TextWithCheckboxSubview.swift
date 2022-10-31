import SwiftUI

struct TextWithCheckboxSubview: View {
    @Binding var isChecked: Bool
    let text: String
    var action: ((Bool) -> Void)?
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Checkbox($isChecked, action: action)
            
            Text(text)
                .font(Font.system(size: 30))
        }
    }

    init(_ binding: Binding<Bool>, text: String, action: ((Bool) -> Void)? = nil) {
        self._isChecked = binding
        self.text = text
        self.action = action
    }
}

struct TextWithCheckboxSubview_Previews: PreviewProvider {
    static var previews: some View {
        TextWithCheckboxSubview(.constant(true), text: "Test")
    }
}
