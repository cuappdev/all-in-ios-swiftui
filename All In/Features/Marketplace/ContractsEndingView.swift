//
//  ContractsEndingView.swift
//  All In
//
//  Created by Angelina Chen on 4/10/25.
//

import SwiftUI

struct ContractsEndingView: View {
    let contracts: [Contract]
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 12) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundStyle(Constants.Colors.white)
                }

                Text("Contracts Ending Today")
                    .font(Constants.Fonts.headerProfile)
                    .foregroundStyle(Constants.Colors.white)
                    .padding(.top, 5)
            }
            .padding(.horizontal)
            .padding(.vertical, 15)

            ScrollView {
                VStack(spacing: 18) {
                    ForEach(contracts, id: \.id) { contract in
                        ContractEndingCard(contract: contract)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 24)
            }

        }
        .background(Constants.Colors.background)
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: Components

extension ContractsEndingView {
    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Contracts Ending Today")
                .font(Constants.Fonts.headerProfile)
                .foregroundStyle(Constants.Colors.white)
        }
    }
}
#Preview {
    ContractsEndingView(contracts: Contract.dummyData.prefix(5).map { $0 })
        .environmentObject(ProfileViewViewModel())
}
