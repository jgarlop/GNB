//
//  GetExchangeRatesUseCase.swift
//  GNB
//
//  Created by Javier Garcia on 8/1/23.
//

import Foundation

protocol GetExchangeRatesUseCaseType {
    func execute() async throws -> [ExchangeRate]
}

struct GetExchangeRatesUseCase {
    let repository: ProductDetailRepository

    func execute() async throws -> [ExchangeRate] {
        try await repository.getRates()
    }
}
