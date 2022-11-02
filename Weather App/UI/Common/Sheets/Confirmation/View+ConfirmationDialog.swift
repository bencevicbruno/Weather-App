//
//  View+ConfirmationDialog.swift
//  Weather App
//
//  Created by Bruno Bencevic on 31.10.2022..
//

import SwiftUI

extension View {
    
    func confirmationDialog(_ dialogBinding: Binding<ConfirmationDialog?>) -> some View {
        ZStack(alignment: .bottom) {
            self
            
            if let dialog = dialogBinding.wrappedValue {
                ConfirmationDialogSheet(dialog: dialog, isVisible: .init(asBool: dialogBinding))
            }
        }
    }
}
