//
//  Array.swift
//  GNB
//
//  Created by Javier Garcia on 8/1/23.
//

import Foundation

/// Allows a safe acess to a specified index instead of a crash
extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
