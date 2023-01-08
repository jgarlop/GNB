//
//  ProductDetailRepository.swift
//  GNB
//
//  Created by Javier Garcia on 8/1/23.
//

import Foundation

struct ProductDetailRepository: ProductDetailData {
    let networkClient: Networking

    func getRates() async throws -> [ExchangeRate] {
        let endpoint = RatesEndpoint()
        let operation = JSONOperation(httpMethod: .get, endpoint: endpoint)

        let exchangeRates = try await networkClient.request(
            operation: operation,
            type: [ExchangeRateDTO].self
        )
            .map(ExchangeRate.init(from:))

        return exchangeRates
    }
}

// MARK: - Mappers
extension ExchangeRate {
    init(from model: ExchangeRateDTO) {
        self.origin = model.fromCurrency
        self.destination = model.toCurrency
        self.rate = model.rate
    }
}

