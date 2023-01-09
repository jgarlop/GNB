//
//  Decimal.swift
//  GNB
//
//  Created by Javier Garcia on 9/1/23.
//

import Foundation

extension Decimal {
    func bankersRounding(scale: Int) -> Self {
        var result = Decimal()
        var current = self
        NSDecimalRound(&result, &current, scale, .bankers)
        return result
    }
}
