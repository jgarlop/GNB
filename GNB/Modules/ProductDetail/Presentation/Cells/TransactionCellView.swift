//
//  TransactionCellView.swift
//  GNB
//
//  Created by Javier Garcia on 9/1/23.
//

import Foundation
import SwiftUI

struct TransactionCellView: View {
    let transaction: Transaction

    var body: some View {
        HStack {
            Text(verbatim: "\(transaction.transactionAmount.bankersRounding(scale: 2))")
            Text(transaction.currency)
                .fontWeight(.bold)
        }
    }
}
