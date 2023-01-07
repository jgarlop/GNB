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
