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


