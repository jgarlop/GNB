//
//  GetProductsUseCase.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation

protocol GetProductsUseCaseType {
    func execute() async throws -> [Product]
}

struct GetProductsUseCase: GetProductsUseCaseType {
    let dataRepository: HomeData

    func execute() async throws -> [Product] {
        try await dataRepository.getProducts().sorted(by: \.sku)
    }
}
