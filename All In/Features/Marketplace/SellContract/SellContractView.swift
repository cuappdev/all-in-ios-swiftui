//
//  SellContractView.swift
//  All In
//
//  Created by Peter Bidoshi on 4/7/25.
//

import SwiftUI

struct SellContractView: View {

    let user: User

    @Environment(\.dismiss) private var dismiss
    @State private var showingSelectedContractView = false
    @State private var selectedContract: Contract?

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 24))
                        .foregroundStyle(Constants.Colors.white)
                        .padding(.top, 20)
                }

                Text("Sell a Contract")
                    .font(Constants.Fonts.headerProfile)
                    .foregroundStyle(Constants.Colors.white)

                Text("Select one of your active bets and put it on the marketplace at your desired price!")
                    .font(Constants.Fonts.sheetBuy)
                    .foregroundStyle(Constants.Colors.white)

                if user.contracts.isEmpty {
                    Text("You don't have any active bets")
                        .font(Constants.Fonts.caption)
                        .foregroundStyle(Constants.Colors.grey00)
                        .padding()
                } else {
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(user.contracts) { contract in
                                Button {
                                    selectedContract = contract
                                    showingSelectedContractView = true
                                } label: {
                                    ActiveBetCard(contract: contract)
                                        .disabled(true)
                                }
                            }
                        }
                    }
                }
            }
            .padding(16)
            .background(Constants.Colors.background)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $showingSelectedContractView) {
                if let contract = selectedContract {
                    SellSelectedContractView(contract: contract, user: user)
                } else {
                    EmptyView()
                }
            }
        }
    }

}

#Preview {
    SellContractView(user: User.dummyData[0])
}
