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

extension String {
    /// Returns a string from the file specified in "tableName", otherwise, using default Localizable.
    public func localized(tableName: String = "Localizable") -> String {
        NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }

    /// Returns a formatted string from the Localizable.strings using the variables passed as arguments.
    /// - Parameter arguments: variables to format the string.
    public func localized(_ arguments: CVarArg...) -> String {
        return String(format: localized(), arguments: arguments)
    }
}
