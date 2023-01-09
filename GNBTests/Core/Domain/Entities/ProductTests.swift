//
//  ProductTests.swift
//  GNBTests
//
//  Created by Javier Garcia on 9/1/23.
//

import Foundation
import XCTest
@testable import GNB

final class ProductTests: XCTestCase {
    let exchangeFinder: ExchangeRateFindable = ExchangeRateFinder(exchangeRates: ExchangeRate.mock)
}

extension ProductTests {
    func testNumberOfTransactions() {
        let product: Product = Product(testCase: .severalTransactionsEUR(count: 4))
        let expectedTransactions = 4

        let result = product.transactions.count

        XCTAssertEqual(expectedTransactions, result)
    }
}

// Product + Mother for creating testing cases
extension Product {
    enum TestCase {
        case severalTransactionsEUR(count: Int)
        case empty
    }

    init(testCase: TestCase){
        switch testCase {
        case .severalTransactionsEUR(let count):
            var transactions: [Transaction] = []
            for _ in 0..<count {
                transactions.append(Transaction(productSku: "", transactionAmount: 1, currency: "EUR"))
            }
            self.init(sku: "", transactions: transactions)
        case .empty:
            self.init(sku: "", transactions: [])
        }
    }
}

