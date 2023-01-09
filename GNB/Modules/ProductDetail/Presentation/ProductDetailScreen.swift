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
        VStack(spacing: .bodySpacing) {
            totalAmountView
            transactionListView
        }
        .navigationTitle(viewModel.data.product.sku)
        .onAppear {
            viewModel.trigger(.getTransactionsAmount)
        }
        .padding(.top)
    }
}

// MARK: - Subviews
extension ProductDetailScreen {
    var totalAmountView: some View {
        VStack(spacing: .totalAmountSpacing) {
            Divider()
                .frame(maxWidth: .infinity)
            Text(verbatim: String.totalAmountTitle(currency: viewModel.data.currencyTarget))
                .fontWeight(.heavy)
                .padding(.top)
            Text(verbatim: "\(viewModel.data.transactionsAmount)")
                .fontWeight(.bold)
                .padding()
                .overlay(
                    Capsule()
                        .stroke(Color.accentColor, lineWidth: .borderWidth)
                )
            Divider()
                .frame(maxWidth: .infinity)
                .padding(.top)
        }
    }

    var transactionListView: some View {
        List(viewModel.data.product.transactions.sorted(by: \.currency)) {
            TransactionCellView(transaction: $0)
                .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
    }
}

// MARK: - Constants
private extension CGFloat {
    static var bodySpacing: Self { 16.0 }
    static var totalAmountSpacing: Self { 8.0 }
    static var borderWidth: Self { 4.0 }
}
private extension String {
    static func totalAmountTitle(currency: String) -> Self {
        "PRODUCT_DETAIL_AMOUNT".localized(currency)
    }
}
