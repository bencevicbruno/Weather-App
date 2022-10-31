import SwiftUI

struct SearchbarSubview: View {
    @Binding var searchKey: String
    var onSearchButtonTapped: ((String) -> Void)?
    
    var body: some View {
        HStack {
            TextField("Insert here", text: $searchKey)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Image("search")
                .resizable()
                .frame(width: 40, height: 40)
                .onTapGesture {
                    self.onSearchButtonTapped?(self.searchKey)
                }
        }
    }
    
    init(_ binding: Binding<String>, onSearchButtonTapped: ((String) -> Void)? = nil) {
        self._searchKey = binding
        self.onSearchButtonTapped = onSearchButtonTapped
    }
}

struct SearchbarSubview_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarSubview(.constant("Test"))
            .background(Color.blue)
    }
}
