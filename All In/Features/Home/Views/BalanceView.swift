//
//  BalanceView.swift
//  All In
//
//  Created by Charles Liggins on 11/10/24.
//

import SwiftUI

struct BalanceView: View {
    @State var balance: String
    @State var showSheet = false

    var body: some View {
        Button {
            showSheet = true
        } label: {
            HStack {
                Image("RedMoney")
                Text(balance)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.black)
            }
        }.sheet(isPresented: $showSheet) {
            BalanceSheetView(showSheet: $showSheet, balance: balance)
                .presentationDetents([.fraction(0.9)])
        }
    }
}
