//
//  GNBViewModel.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation

protocol GNBViewModel<ViewData, ViewInput>: ObservableObject {
    associatedtype ViewData
    associatedtype ViewInput

    var data: ViewData { get }
    func trigger(_ input: ViewInput)
}
