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
        LoadingView(loading: viewModel.data.isLoading) {
            contentView
        }
        .onAppear { [weak viewModel] in
            viewModel?.trigger(.getProducts)
        }
    }
}

// MARK: - Subviews
private extension HomeScreen {
    var contentView: some View {
        List(viewModel.data.products) {
            ProductCellView(product: $0)
        }
        .navigationTitle(Text(verbatim: .homeNavTitle))
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden()
        .toolbar {
            rightNavBarButton
        }
    }

    var rightNavBarButton: some View {
        Button {
            // TODO: Action
            print("Action")
        } label : {
            Image(systemName: .rightNavButtonImageName)
        }
    }
}

// MARK: - Constants
private extension String {
    static var homeNavTitle: Self { "HOME_TITLE".localized() }
    static var rightNavButtonImageName: Self { "info.circle.fill" }
}

#if DEBUG
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        let factory = HomeViewFactory()
        return factory.buildHomePreview()
    }
}
#endif
