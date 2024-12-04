//
//  BalanceSheetView.swift
//  All In
//
//  Created by Charles Liggins on 11/10/24.
//

import SwiftUI

struct BalanceSheetView: View {

    @Binding var showSheet: Bool
    @State var balance: String

    var body: some View {
        SheetView(
            title: balance,
            subTitle: "",
            description: "BALANCE",
            buttonText: "Buy Now",
            showSheet: $showSheet
        ) {
            VStack {
                Text("Hey")
            }
        }
    }
}
