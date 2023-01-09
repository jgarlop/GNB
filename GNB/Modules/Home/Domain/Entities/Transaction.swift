//
//  Transaction.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation

struct Transaction: Identifiable {
    let id: String = UUID().uuidString
    let productSku: Product.ID
    let transactionAmount: Decimal
    let currency: String
}

