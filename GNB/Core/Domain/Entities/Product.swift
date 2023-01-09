//
//  Product.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation

struct Product: Identifiable {
    var id: String {
        sku
    }
    
    let sku: String
    let transactions: [Transaction]
}

extension Product {
    func totalAmount(in currency: String, exchangeFinder: ExchangeRateFindable) -> Decimal {
        let amounts = transactions.compactMap {
            exchangeFinder.convert(
                originCurrency: $0.currency,
                to: currency,
                quantity: $0.transactionAmount
            )
        }

        return amounts.reduce(0, +)
    }
}
