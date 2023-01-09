//
//  ProductDetailFactory.swift
//  GNB
//
//  Created by Javier Garcia on 9/1/23.
//

import Foundation
import SwiftUI

struct ProductDetailFactory {
    static func buildProductDetailModule(with product: Product) -> some View {
        let networking = Injector.shared.networking
        let repository = ProductDetailRepository(networkClient: networking)
        let getRatesUseCase = GetExchangeRatesUseCase(repository: repository)
        let exchangeFinder = Injector.shared.exchangeRateFinder
        let viewModel = ProductDetailVM(product: product, getExchangeRateUseCase: getRatesUseCase, rateFinder: exchangeFinder)
        let view = ProductDetailScreen(viewModel: viewModel)

        return view
    }
}
