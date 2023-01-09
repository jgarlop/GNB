//
//  ExchangeRateTests.swift
//  GNBTests
//
//  Created by Javier Garcia on 9/1/23.
//

import Foundation
import XCTest

@testable import GNB

final class ExchangeRateTest: XCTestCase {
    var sut = ExchangeRate.mock

    override func setUp() {
        sut = ExchangeRate.mock
        super.setUp()
    }
}

extension ExchangeRateTest {
    func testFindInvertedSuccess() {
        let existingRateWithInversion = ExchangeRate(origin: "USD", destination: "EUR", rate: 0.96)

        let inverse = sut.findInverse(existingRateWithInversion)

        XCTAssertNotNil(inverse)
    }

    func testFindInvertedFailure() {
        let existingRateWithoutInversion = ExchangeRate(origin: "JPY", destination: "USD", rate: 0.96)

        let inverse = sut.findInverse(existingRateWithoutInversion)

        XCTAssertNil(inverse)
    }

    func testAppendInverted() {
        let invertedNotProvided = ExchangeRate(origin: "EUR", destination: "GBP", rate: 0.86)
        let invertedAppended = sut.appendingInverseRates()

        let exchangeRate = invertedAppended
            .first(where: {
                $0.origin == invertedNotProvided.origin && $0.destination == invertedNotProvided.destination
            })

        XCTAssertNotNil(exchangeRate)
        XCTAssertEqual(invertedNotProvided.rate, exchangeRate?.rate.bankersRounding(scale: 2))
    }
}
