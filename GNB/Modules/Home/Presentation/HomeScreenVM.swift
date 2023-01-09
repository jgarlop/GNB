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
            Task {
                await getProducts()
            }
        }
    }
}

extension HomeScreenVM {
    struct ViewData {
        var products: [Product] = []
        var isLoading: Bool = false
    }

    enum ViewInput {
        case getProducts
    }
}

// MARK: - Private methods
private extension HomeScreenVM {
    func getProducts() async {
        // Avoiding fetching when loading or already fetched (backend returns a random list every time)
        guard !data.isLoading, data.products.isEmpty else { return }
        setLoadingState(true)
        defer { setLoadingState(false) }

        do {
            let products = try await getProductsUseCase.execute()
            setProducts(products)
        } catch {
            print(error)
        }
    }

    func setProducts(_ products: [Product]) {
        DispatchQueue.main.async {
            self.data.products = products
        }
    }

    func setLoadingState(_ loading: Bool) {
        DispatchQueue.main.async {
            self.data.isLoading = loading
        }
    }
}
