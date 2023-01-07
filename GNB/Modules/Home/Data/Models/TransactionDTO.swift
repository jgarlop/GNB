//
//  TransactionDTO.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation

struct TransactionDTO: Decodable {
    let sku: String
    let amount: Decimal
    let currency: String
}
