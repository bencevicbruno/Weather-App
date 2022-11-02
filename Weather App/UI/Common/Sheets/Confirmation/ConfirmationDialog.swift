//
//  ConfirmationDialog.swift
//  Weather App
//
//  Created by Bruno Bencevic on 31.10.2022..
//

import Foundation

struct ConfirmationDialog {
    let message: String
    let confirmTitle: String
    let declineTitle: String
    let confirmAction: EmptyCallback
    let declineAction: EmptyCallback
    
    init(message: String, confirmTitle: String = "Confirm", declineTitle: String = "Decline", confirmAction: @escaping EmptyCallback = {}, declineAction: @escaping EmptyCallback = {}) {
        self.message = message
        self.confirmTitle = confirmTitle
        self.declineTitle = declineTitle
        self.confirmAction = confirmAction
        self.declineAction = declineAction
    }
}
