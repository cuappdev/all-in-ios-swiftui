//
//  CartView.swift
//  All In
//
//  Created by Hsia Lu wu on 3/2/25.
//
import SwiftUI

struct CartView: View {

    @State var contracts: [Contract]

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Cart")
                        .font(Constants.Fonts.header)

                    Spacer()

                    Button {
                        // navigation: close the cart view
                    } label: {
                        Image("X")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                .padding(.horizontal, 19)

                HStack {
                    Text("Game")

                    Spacer()

                    Text("Parlay")
                }
                .padding(.leading, 19)
                .padding(.trailing, 19)

                Divider()
                    .overlay(Color.gray)
                    .padding(.leading, 19)
                    .padding(.trailing, 19)

                ScrollView {
                    ForEach(contracts) {
                        contract in
                        ContractTile(contract: contract)

                        Divider()
                            .overlay(Color.gray)
                            .padding(.horizontal, 19)
                    }
                }

                // Total amount
                VStack {
                    HStack {
                        Text("Totals")
                            .font(Constants.Fonts.cartTitle)

                        Spacer()
                    }

                    HStack {
                        Text("Contract Bets Total")
                            .font(Constants.Fonts.cartEvent)

                        Spacer()

                        VStack {
                            // Total amount
                            Text("$80")
                                .font(Constants.Fonts.cartEvent)

                            Text("Wins $240 if all true")
                                .font(Constants.Fonts.cartNote)
                        }
                    }
                }
                .padding(.horizontal, 19)
                .padding(.top, 16)
            }
        }

    }

}

#Preview {
    CartView(contracts: Contract.dummyData)
}
