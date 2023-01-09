//
//  ExchangeRateDTO.swift
//  GNB
//
//  Created by Javier Garcia on 8/1/23.
//

import Foundation

struct ExchangeRateDTO: Decodable {
    let fromCurrency: String
    let toCurrency: String
    let rate: Decimal

    enum CodingKeys: String, CodingKey {
        case fromCurrency = "from"
        case toCurrency = "to"
        case rate
    }
}
