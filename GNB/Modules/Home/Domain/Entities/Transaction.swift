//
//  Transaction.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation

struct Transaction {
    let id: String = UUID().uuidString
    let product: Product
    let transactionAmount: Decimal
    let currency: String
}
