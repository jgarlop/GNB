//
//  String.swift
//  GNBTests
//
//  Created by Javier Garcia on 4/1/23.
//

import Foundation
import XCTest

@testable import GNB

final class StringExtensionsTests: XCTestCase {}

extension StringExtensionsTests {
    func testApiInfoPlistValueSuccess() {
        // GIVEN
        let infoPlistKey: String.InfoPlistKeys = .apiUrl
        let expected = "https://android-ios-service-herokuapp.com"

        // WHEN
        let value = try? String.infoPlistValue(for: infoPlistKey)

        // THEN
        XCTAssertNotNil(value)
        XCTAssertTrue(value == expected)
    }
}
