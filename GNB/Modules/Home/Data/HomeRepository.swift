//
//  HomeRepository.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation

struct HomeRepository: HomeData {
    let networkClient: Networking

    func getTransactions() async throws -> [Transaction] {
        let endpoint = TransactionsEndpoint()
        let operation = JSONOperation(httpMethod: .get, endpoint: TransactionsEndpoint())
        let transactions = try await networkClient.request(operation: operation, type: [TransactionDTO].self)
            .map(Transaction.init(from:))

        return transactions
    }
}

// MARK: - Mappers
extension Transaction {
    init(from model: TransactionDTO) {
        self.product = Product(sku: model.sku)
        self.currency = model.currency
        self.transactionAmount = model.amount
    }
}
