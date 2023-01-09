//
//  ProductDetailScreen.swift
//  GNB
//
//  Created by Javier Garcia on 8/1/23.
//

import Foundation
import SwiftUI

struct ProductDetailScreen<ViewModel>: View where ViewModel: GNBViewModel<ProductDetailVM.ViewData, ProductDetailVM.ViewInput> {
    
    @StateObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Text(verbatim: String.totalAmountTitle(currency: viewModel.data.currencyTarget))
            Text(verbatim: "\(viewModel.data.transactionsAmount)")
                .fontWeight(.bold)
            List(viewModel.data.product.transactions) {
                TransactionCellView(transaction: $0)
            }
        }
        .navigationTitle(viewModel.data.product.sku)
        .onAppear {
            viewModel.trigger(.getTransactionsAmount)
        }
    }
}

// MARK: - Constants
private extension String {
    static func totalAmountTitle(currency: String) -> Self { // MARK: - Product Detail
        "PRODUCT_DETAIL_AMOUNT".localized(currency)
    }
}
