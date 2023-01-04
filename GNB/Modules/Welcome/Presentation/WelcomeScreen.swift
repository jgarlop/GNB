//
//  ContentView.swift
//  GNB
//
//  Created by Javier Garcia on 4/1/23.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
