//
//  ProductCellView.swift
//  GNB
//
//  Created by Javier Garcia on 9/1/23.
//

import Foundation
import SwiftUI

struct ProductCellView: View {
    let product: Product

    var body: some View {
        HStack {
            Text(product.id)
                .font(.title3)
                .foregroundColor(.accentColor)
        }
    }
}
