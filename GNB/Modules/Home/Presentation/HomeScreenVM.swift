//
//  HomeScreenVM.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation
final class HomeScreenVM: GNBViewModel {
    @Published var data: ViewData = ViewData()

    let getTransactionsUseCase: GetTransactionsUseCaseType

    init(getTransactionsUseCase: GetTransactionsUseCaseType) {
        self.getTransactionsUseCase = getTransactionsUseCase
    }
}

// MARK: - View input
extension HomeScreenVM {
    func trigger(_ input: ViewInput) {
        switch input {
        case .getTransactions:
            getTransactions()
        }
    }
}

extension HomeScreenVM {
    struct ViewData {
        var transactions: [Transaction] = []
    }

    enum ViewInput {
        case getTransactions
    }
}

private extension HomeScreenVM {
    private func getTransactions() {
        Task {
            do {
                let transactions = try await getTransactionsUseCase.execute()
                await setTransactions(transactions)
            } catch {
                print(error)
            }
        }
    }

    @MainActor
    private func setTransactions(_ transactions: [Transaction]) {
        data.transactions = transactions
    }
}
