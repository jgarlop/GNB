//
//  GetTransactionsUseCase.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation

protocol GetTransactionsUseCaseType {
    func execute() async throws -> [Transaction]
}

struct GetTransactionsUseCase: GetTransactionsUseCaseType {
    let dataRepository: HomeData

    func execute() async throws -> [Transaction] {
        try await dataRepository.getTransactions()
    }
}
