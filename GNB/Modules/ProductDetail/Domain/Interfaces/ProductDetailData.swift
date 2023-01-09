//
//  ProductDetailData.swift
//  GNB
//
//  Created by Javier Garcia on 8/1/23.
//

import Foundation

protocol ProductDetailData {
    func getRates() async throws -> [ExchangeRate]
}
