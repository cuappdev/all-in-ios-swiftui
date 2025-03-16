//
//  ContractTile.swift
//  All In
//
//  Created by Hsia Lu wu on 3/2/25.
//
import SwiftUI

struct ContractTile: View {

    @State var contract: Contract
    @State var isSelected: Bool = false

    var body: some View {
        VStack {
            HStack {
                // school logo?

                Text("Cornell v. " + contract.opposingTeam)
                    .font(Constants.Fonts.cartTitle)

                Spacer()

                // checkbox
                Toggle("", isOn: $isSelected)
                    .labelsHidden()
                    .toggleStyle(ToggleCheckboxStyle())
            }

            HStack {
                Text(contract.event)
                    .font(Constants.Fonts.cartEvent)

                Spacer()

                VStack {
                    // buy price
                    Text("$ " + String(contract.buyPrice))
                        .font(Constants.Fonts.cartPrice)

                    // note
                    Text("Wins "  + String(contract.value) + " if true")
                        .font(Constants.Fonts.cartNote)
                        .foregroundStyle(Color.gray)
                }
            }
            .padding(.top, 18)
        }
        .padding(.horizontal, 19)
    }

}

#Preview {
    ContractTile(contract: Contract.dummyData[1])
}
