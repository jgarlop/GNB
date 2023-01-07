//
//  LazyView.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation
import SwiftUI

struct LazyView<ContentView: View>: View {
    let content: () -> ContentView

    var body: some View {
        self.content()
    }
}
