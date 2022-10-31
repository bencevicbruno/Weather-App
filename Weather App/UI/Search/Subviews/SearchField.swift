//
//  SearchField.swift
//  Weather App
//
//  Created by Bruno Bencevic on 27.10.2022..
//

import SwiftUI

struct SearchField: View {
    
    @Binding var searchText: String
    @FocusState var isSearchFieldInFocus: Bool
    
    private let isEditing: Bool
    
    init(_ searchText: Binding<String>, isSearchFieldInFocus: FocusState<Bool>, isEditing: Bool) {
        self._searchText = searchText
        self._isSearchFieldInFocus = isSearchFieldInFocus
        self.isEditing = isEditing
    }
    
    var body: some View {
        HStack(spacing: 0) {
            TextField("Location", text: $searchText)
                .focused($isSearchFieldInFocus)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            
            Image(systemName: "delete.left")
                .frameAsIcon(innerSize: 16, outerSize: 40)
                .opacity(isEditing ? 1 : 0)
                .onTapGesture {
                    searchText = ""
                }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .frame(height: isEditing ? 50 : 40)
        .background(.white.opacity(0.5))
        .clipShape(Capsule())
    }
}

struct SearchField_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            SearchField(.constant("Example"), isSearchFieldInFocus: .init(), isEditing: true)
            
            SearchField(.constant("Example"), isSearchFieldInFocus: .init(), isEditing: false)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("image_background")
                .resizable()
                .scaledToFill()
        ).edgesIgnoringSafeArea(.all)
    }
}
