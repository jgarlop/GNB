//
//  AboutScreen.swift
//  GNB
//
//  Created by Javier Garcia on 9/1/23.
//

import SwiftUI

struct AboutScreen: View {
    var body: some View {
        VStack(spacing: .spacing) {
            Image(.gnbLogo)
                .resizable()
                .scaledToFit()
                .frame(width: .gnbLogoWidth)
            Text(verbatim: .description)
            Text(.linkedinURL)
            Image(.trueStoryLogo)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(height: .trueStoryLogoHeight)
        }
    }
}

// MARK: - Constants

private extension String {
    static var description: Self { "ABOUT_DESCRIPTION".localized() }
    static var gnbLogo: Self { "img_gnb_logo" }
    static var trueStoryLogo: Self { "img_true_story"}
}

private extension LocalizedStringKey {
    static var linkedinURL: Self {
        LocalizedStringKey("ABOUT_LINKEDIN".localized())
    }
}

private extension CGFloat {
    static var spacing: Self { 16 }
    static var gnbLogoWidth: Self { UIScreen.main.bounds.width / 2 }
    static var trueStoryLogoHeight: Self { UIScreen.main.bounds.height / 4 }
}


#if DEBUG
struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
#endif
