//
//  HomeScreen.swift
//  GNB
//
//  Created by Javier Garcia on 6/1/23.
//

import SwiftUI

struct HomeScreen<ViewModel>: View where ViewModel: GNBViewModel<HomeScreenVM.ViewData, HomeScreenVM.ViewInput> {

    private let viewFactory = HomeViewFactory()
    @StateObject var viewModel: ViewModel

    @State private var showAbout: Bool = false

    var body: some View {
        LoadingView(loading: viewModel.data.isLoading) {
            contentView
        }
        .popover(isPresented: $showAbout, arrowEdge: .top) {
            viewFactory.buildAboutView()
        }
        .onAppear { [weak viewModel] in
            viewModel?.trigger(.getProducts)
        }
    }
}

// MARK: - Subviews
private extension HomeScreen {
    var contentView: some View {
        List(viewModel.data.products) { product in
            NavigationLink(destination: viewFactory.buildProductDetailView(with: product)) {
                ProductCellView(product: product)
            }
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
            showAbout = true
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
