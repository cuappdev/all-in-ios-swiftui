//
//  ContractTile.swift
//  All In
//
//  Created by Hsia Lu wu on 3/2/25.
//
import SwiftUI

struct ContractTile: View {

    @State var contract: Contract

    var body: some View {
        VStack {
            HStack {
                // school logo?

                Text("Cornell v. " + contract.opposingTeam)
                    .font(Constants.Fonts.bodyBold)

                Spacer()

                // checkbox
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
        .padding(.leading, 19)
        .padding(.trailing, 19)
    }

}

#Preview {
    ContractTile(contract: Contract.dummyData[1])
}
