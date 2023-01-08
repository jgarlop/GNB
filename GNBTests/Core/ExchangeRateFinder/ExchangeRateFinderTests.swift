//
//  ExchangeRateFinder.swift
//  GNBTests
//
//  Created by Javier Garcia on 8/1/23.
//

import Foundation
import XCTest

@testable import GNB

final class ExchangeRateFinderTests: XCTestCase {
    let sut = ExchangeRateFinder(exchangeRates: ExchangeRate.mock)
}

extension ExchangeRateFinderTests {
    func testPathFromUsdToCadSuccess() {
        let expected: [String] = ["USD", "EUR", "JPY", "CAD"]

        let result = sut.findPath(origin: "USD", destination: "CAD")

        XCTAssertEqual(result, expected)
    }

    func testPathFromJpyToEurSuccess() {
        let expected: [String] = ["JPY", "USD", "EUR"]

        let result = sut.findPath(origin: "JPY", destination: "EUR")

        XCTAssertEqual(result, expected)
    }

    func testPathJpyToEurFailure() {
        let expected: [String] = ["JPY", "CAD", "USD", "EUR"]

        let result = sut.findPath(origin: "JPY", destination: "EUR")

        XCTAssertNotEqual(result, expected)
    }

    func testPathFromEurToCadSuccess() {
        let expected: [String] = ["EUR", "JPY", "CAD"]

        let result = sut.findPath(origin: "EUR", destination: "CAD")

        XCTAssertEqual(result, expected)
    }

    func testRateFromEurToCadSuccess() {
        let quantity: Decimal = 2
        let expected: Decimal = quantity * 100.15 * 0.07

        let conversion = sut.convert(originCurrency: "EUR", to: "CAD", quantity: quantity)

        XCTAssertEqual(expected, conversion)
    }

    func testRateFromJpyToAudFailure() {
        let quantity: Decimal = 1

        let conversion = sut.convert(originCurrency: "JPY", to: "AUD", quantity: quantity)

        XCTAssertNil(conversion)
    }
}


private extension ExchangeRate {
    static let mock: [ExchangeRate] = [
        .init(origin: "EUR", destination: "USD", rate: 1.04),
        .init(origin: "USD", destination: "EUR", rate: 0.96),
        .init(origin: "GBP", destination: "EUR", rate: 1.16),
        .init(origin: "JPY", destination: "USD", rate: 0.0073),
        .init(origin: "AUD", destination: "INR", rate: 55.29),
        .init(origin: "CAD", destination: "USD", rate: 0.74),
        .init(origin: "INR", destination: "EUR", rate: 0.012),
        .init(origin: "EUR", destination: "JPY", rate: 100.15),
        .init(origin: "JPY", destination: "CAD", rate: 0.07)
    ]
}


