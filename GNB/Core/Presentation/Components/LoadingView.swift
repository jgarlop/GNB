//
//  LoadingView.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation
import SwiftUI

struct LoadingView<ContentView: View>: View {
    var content: () -> ContentView

    var isLoading: Bool

    init(loading: Bool, @ViewBuilder content: @escaping () -> ContentView) {
        self.content = content
        self.isLoading = loading
    }

    var body: some View {
        ZStack {
            content()
            loadingView
        }
    }

    @ViewBuilder
    private var loadingView: some View {
        if isLoading {
            ProgressView()
                .progressViewStyle(.circular)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        }
    }
}
