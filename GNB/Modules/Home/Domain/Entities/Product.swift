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

    func totalAmount(in: String, exchangeFinder: ExchangeRateFindable) -> Decimal {
        let amounts = transactions.compactMap {
            exchangeFinder.convert(
                originCurrency: $0.currency,
                to: "EUR",
                quantity: $0.transactionAmount
            )
        }
        
        return amounts.reduce(0, +)
    }
}
