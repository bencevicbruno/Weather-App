//
//  Coordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import Foundation
import UIKit

public protocol Coordinator: AnyObject {
    @discardableResult
    func start() -> UIViewController
}
