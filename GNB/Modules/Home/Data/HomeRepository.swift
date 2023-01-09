//
//  HomeRepository.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation

struct HomeRepository: HomeData {
    let networkClient: Networking

    func getProducts() async throws -> [Product] {
        let endpoint = TransactionsEndpoint()
        let operation = JSONOperation(httpMethod: .get, endpoint: endpoint)
        
        let products = try await networkClient.request(
            operation: operation, type: [TransactionDTO].self
        )
            .map(Transaction.init(from:))
            .uniquedProducts()

        return products
    }
}

extension Transaction {
    init(from model: TransactionDTO) {
        self.productSku = model.sku
        self.currency = model.currency
        self.transactionAmount = model.amount
    }
}

extension Array where Element == Transaction {
    func uniquedProducts() -> [Product] {
        let uniqueProductSkus = Array<String>(Set(self.map(\.productSku)))
        let products = uniqueProductSkus
            .map { sku -> Product in
                Product(sku: sku, transactions: self.filter { $0.productSku == sku })
            }

        return products
    }
}
