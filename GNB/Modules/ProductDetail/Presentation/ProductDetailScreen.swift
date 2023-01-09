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
            Text(viewModel.data.product.sku)
        }
        .navigationTitle(viewModel.data.product.sku)
    }
}
