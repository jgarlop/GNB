//
//  HomeScreen.swift
//  GNB
//
//  Created by Javier Garcia on 6/1/23.
//

import SwiftUI

struct HomeScreen<ViewModel>: View where ViewModel: GNBViewModel<HomeScreenVM.ViewData, HomeScreenVM.ViewInput> {
    
    @StateObject var viewModel: ViewModel

    var body: some View {
        List(viewModel.data.transactions, id: \.id) { transaction in
            Text(transaction.product.sku)
        }
        .onAppear { [weak viewModel] in
            viewModel?.trigger(.getTransactions)
        }
    }
}

#if DEBUG
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        let factory = HomeViewFactory()
        return factory.buildHomePreview()
    }
}
#endif
