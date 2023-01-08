//
//  Sequence.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation

extension Sequence {
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        sorted { lhs, rhs in
            lhs[keyPath: keyPath] < rhs[keyPath: keyPath]
        }
    }
}

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        Array(Set(self))
    }
}


