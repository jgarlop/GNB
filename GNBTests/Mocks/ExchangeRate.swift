//
//  ExchangeRate.swift
//  GNBTests
//
//  Created by Javier Garcia on 9/1/23.
//

import Foundation
@testable import GNB

extension ExchangeRate {
    static let mock: [ExchangeRate] = [
        .init(origin: "EUR", destination: "USD", rate: 1.04),
        .init(origin: "USD", destination: "EUR", rate: 0.96),
        .init(origin: "GBP", destination: "EUR", rate: 1.16),
        .init(origin: "JPY", destination: "USD", rate: 0.0073),
        .init(origin: "AUD", destination: "INR", rate: 55.29),
        .init(origin: "CAD", destination: "USD", rate: 0.74),
        .init(origin: "INR", destination: "EUR", rate: 0.012),
        .init(origin: "EUR", destination: "JPY", rate: 100.15),
        .init(origin: "JPY", destination: "CAD", rate: 0.07)
    ]
}
