//
//  ExchangeRate.swift
//  GNB
//
//  Created by Javier Garcia on 8/1/23.
//

import Foundation

struct ExchangeRate {
    let origin: String
    let destination: String
    let rate: Decimal
}

extension ExchangeRate: Equatable { }

extension Array where Element == ExchangeRate {
    func appendingInverseRates() -> Self {
        var currentRates = self
        self.forEach { rate in
            if findInverse(rate) == nil {
                let inverseExchangeRate: Decimal = (1 / rate.rate)
                let inverse = ExchangeRate(origin: rate.destination, destination: rate.origin, rate: inverseExchangeRate)
                currentRates.append(inverse)
            }
        }
        return currentRates
    }

    func findInverse(_ rate: ExchangeRate) -> ExchangeRate? {
        first(where: { $0.origin == rate.destination && $0.destination == rate.origin})
    }
}
