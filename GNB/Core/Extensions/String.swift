//
//  String.swift
//  GNB
//
//  Created by Javier Garcia on 4/1/23.
//

import Foundation

extension String {
    enum InfoPlistKeys: String {
        case apiUrl = "API_URL"
    }

    enum InfoPlistError: Error {
        case valueNotFound, couldNotParseType
    }

    /// Returns the value as a String from the info.plist file
    /// - Parameter key: Key for the wanted value.
    /// - Returns: Value as String.
    /// - Throws: Can throw an InfoPlistError.
    static func infoPlistValue(for key: InfoPlistKeys) throws -> String? {
        switch key {
        case .apiUrl:
            let mainBundle = Bundle.main
            let value = mainBundle.object(forInfoDictionaryKey: key.rawValue)

            guard value != nil else {
                throw InfoPlistError.valueNotFound
            }

            guard let valueAsString = value as? String else {
                throw InfoPlistError.couldNotParseType
            }

            return valueAsString
        }
    }
}
