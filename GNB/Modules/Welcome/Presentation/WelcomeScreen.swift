//
//  ContentView.swift
//  GNB
//
//  Created by Javier Garcia on 4/1/23.
//

import SwiftUI

struct WelcomeScreen: View {
    @State private var isContentVisible: Bool = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.white, .accentColor],
                startPoint: .center,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack {
                header
                    .padding(.top, .topPadding)

                enterButton

                Spacer()
            }
            .padding(.horizontal, .horizontalPadding)
            .zIndex(.zero)
            .opacity(isContentVisible ? 1 : .zero)
            .animation(.easeIn(duration: .animationDuration), value: isContentVisible)
        }
        .onAppear { triggerLogoAnimation() }
    }
}

// MARK: - Subviews
private extension WelcomeScreen {
    var header: some View {
        VStack {
            Image(.logoImageName)
                .imageScale(.large)
                .foregroundColor(.accentColor)

            Text(verbatim: .headlineText)
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, .titlePadding)

            Spacer()
        }
    }

    var enterButton: some View {
        Button {
            // TODO: Navigate to detail
        } label: {
            Text(verbatim: .buttonTitle)
                .font(.title2)
        }
        .padding()
        .foregroundColor(.accentColor)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(.buttonCornerRadius)
    }
}

// MARK: - Methods

private extension WelcomeScreen {
    func triggerLogoAnimation() {
        withAnimation {
            isContentVisible = true
        }
    }
}

// MARK: - Constants
private extension String {
    static var headlineText: Self { "WELCOME_TITLE".localized() }
    static var buttonTitle: Self { "ENTER".localized() }
    static var logoImageName: Self { "img_gnb_logo" }
}

private extension CGFloat {
    static var topPadding: Self { UIScreen.main.bounds.height / 6 }
    static var titlePadding: Self { 16 }
    static var buttonCornerRadius: Self { 12 }
    static var horizontalPadding: Self { 16 }
    static var animationDuration: Self { 0.5 }
}

private extension Double {
    static var animationDuration: Self { 0.75 }
}

private extension CGSize {
    static var buttonCornerRadius: Self { .init(width: 12, height: 12) }
}

// MARK: - Preview
#if DEBUG
struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
#endif
