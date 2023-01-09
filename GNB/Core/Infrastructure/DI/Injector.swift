//
//  Injector.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation

final class Injector {
    static let shared: Injector = Injector()
    private init() { }

    lazy var appConfiguration: AppConfigurationType = {
        AppConfiguration()
    }()

    lazy var networking: Networking = {
        NetworkClient(apiURL: appConfiguration.apiURL)
    }()

    lazy var exchangeRateFinder: ExchangeRateFindable = {
        ExchangeRateFinder(exchangeRates: [])
    }()
}
