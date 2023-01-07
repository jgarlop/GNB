//
//  AppConfiguration.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation

protocol AppConfigurationType {
    var apiURL: URL { get }
}

struct AppConfiguration: AppConfigurationType {
    var apiURL: URL {
        do {
            let string = try String.infoPlistValue(for: .apiUrl)
            return URL(string: string!)!
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
