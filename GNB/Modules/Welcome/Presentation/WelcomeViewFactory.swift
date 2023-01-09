//
//  WelcomeViewFactory.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation
import SwiftUI

struct WelcomeViewFactory {
    func buildHomeView() -> some View {
        LazyView {
            HomeViewFactory.buildHomeModule()
        }
    }

    static func buildWelcomeModule() -> some View {
        LazyView {
            WelcomeScreen()
        }
    }
}
