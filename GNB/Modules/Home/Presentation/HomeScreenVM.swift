//
//  HomeScreenVM.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation
final class HomeScreenVM: GNBViewModel {
    @Published var data: ViewData = ViewData()

    let getProductsUseCase: GetProductsUseCaseType

    init(getProductsUseCase: GetProductsUseCaseType) {
        self.getProductsUseCase = getProductsUseCase
    }
}

// MARK: - View input
extension HomeScreenVM {
    func trigger(_ input: ViewInput) {
        switch input {
        case .getProducts:
            getProducts()
        }
    }
}

extension HomeScreenVM {
    struct ViewData {
        var products: [Product] = []
    }

    enum ViewInput {
        case getProducts
    }
}

private extension HomeScreenVM {
    func getProducts() {
        Task {
            do {
                let products = try await getProductsUseCase.execute()
                await setProducts(products)
            } catch {
                print(error)
            }
        }
    }

    @MainActor
    func setProducts(_ products: [Product]) {
        data.products = products
    }
}
