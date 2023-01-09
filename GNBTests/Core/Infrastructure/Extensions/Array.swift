//
//  Array.swift
//  GNBTests
//
//  Created by Javier Garcia on 8/1/23.
//

import Foundation
import XCTest

@testable import GNB

final class ArrayTests: XCTestCase {
    let sut: Array<Int> = [0, 1, 2, 3, 4, 5]
}

extension ArrayTests {
    func testSafeAccessSuccess() {
        let index = 2
        let expected = 2

        let element = sut[safe: index]

        XCTAssertEqual(element, expected)
    }

    func testSafeAccessNoElement() {
        let index = 10

        let element = sut[safe: index]

        XCTAssertNil(element)
    }
}
