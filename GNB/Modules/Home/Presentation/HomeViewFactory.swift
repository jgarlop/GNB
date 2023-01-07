//
//  HomeViewFactory.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation
import SwiftUI

struct HomeViewFactory {
    func buildHomePreview() -> some View {
        let repository = HomeRepository(networkClient: Injector.shared.networking)
        let useCase = GetProductsUseCase(dataRepository: repository)
        let vm = HomeScreenVM(getProductsUseCase: useCase)
        return HomeScreen(viewModel: vm)
    }

    static func buildHomeModule() -> some View {
        let repository = HomeRepository(networkClient: Injector.shared.networking)
        let useCase = GetProductsUseCase(dataRepository: repository)
        let vm = HomeScreenVM(getProductsUseCase: useCase)
        return HomeScreen(viewModel: vm)
    }
}
