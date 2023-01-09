//
//  ProductDetailVM.swift
//  GNB
//
//  Created by Javier Garcia on 8/1/23.
//

import Foundation

final class ProductDetailVM: GNBViewModel {
    let product: Product
    let getExchangeRatesUseCase: GetExchangeRatesUseCaseType

    var exchangeFinder: ExchangeRateFindable

    @Published var data: ViewData

    init(
        product: Product,
        getExchangeRateUseCase: GetExchangeRatesUseCaseType,
        rateFinder: ExchangeRateFindable
    ) {
        self.product = product
        self.getExchangeRatesUseCase = getExchangeRateUseCase
        self.exchangeFinder = rateFinder
        self.data = ViewData(product: product)
    }
}

extension ProductDetailVM {
    func trigger(_ input: ViewInput) {
        switch input {
        case .getTransactionsAmount:
            Task {
                await getTransactionsAmount()
            }
        }
    }
}

extension ProductDetailVM {
    enum ViewInput {
        case getTransactionsAmount
    }

    struct ViewData {
        let product: Product
        var currencyTarget: String = "EUR"
        var transactionsAmount: Decimal = .zero
        var isLoading: Bool = false
    }
}

private extension ProductDetailVM {
    func getTransactionsAmount() async {
        do {
            let exchangeRates = try await getExchangeRatesUseCase.execute()
            exchangeFinder.exchangeRates = exchangeRates

            let total = product.totalAmount(in: data.currencyTarget, exchangeFinder: exchangeFinder)
            setTransactionsAmount(total)
        } catch {
            print(error.localizedDescription)
        }
    }

    func setTransactionsAmount(_ decimal: Decimal) {
        DispatchQueue.main.async {
            self.data.transactionsAmount = decimal.bankersRounding(scale: 2)
        }
    }
}


