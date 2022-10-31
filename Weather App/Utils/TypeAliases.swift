//
//  TypeAliases.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import Foundation

typealias EmptyCallback = () -> Void
typealias Callback<T> = (T) -> Void
typealias ServiceResult<T> = Result<T, Error>
