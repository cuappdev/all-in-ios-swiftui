//
//  SellSelectedContractView.swift
//  All In
//
//  Created by Peter Bidoshi on 4/7/25.
//

import SwiftUI

struct SellSelectedContractView: View {

    let contract: Contract
    let player: Player
    let user: User

    @Environment(\.dismiss) private var dismiss
    @State private var price: Int?
    @State private var priceString: String = ""

    init(contract: Contract, user: User) {
        self.contract = contract
        self.player = Contract.getPlayer(contract)
        self.user = user
    }

    var body: some View {
        VStack {
            headingCostGain

            Spacer()

            priceSetter

            Spacer()

            sellingText

            Spacer()

            confirmButton(disabled: price == nil)
        }
        .padding(16)
        .background(Constants.Colors.background)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }

    var headingCostGain: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .font(.system(size: 24))
                    .foregroundStyle(Constants.Colors.white)
                    .padding(.top, 20)
            }

            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(player.firstName) \(player.lastName) v. \(contract.opposingTeam)")
                        .font(Constants.Fonts.headerProfile)
                        .foregroundStyle(Constants.Colors.white)
                        .lineLimit(1)
                        .truncationMode(.tail)

                    Text("\(Date().monthDayFormat) | Men's Basketball")
                        .font(Constants.Fonts.rankingPill)
                        .foregroundStyle(Constants.Colors.white)
                        .lineLimit(1)
                        .truncationMode(.tail)

                    Text("\(contract.eventThreshold) \(contract.event)")
                        .font(Constants.Fonts.rankingPill)
                        .foregroundStyle(Constants.Colors.white)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Image("Player\(Contract.getPlayer(contract).number)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 64, height: 64)
            }

            VStack(alignment: .center, spacing: 4) {
                Text("Cost \(contract.buyPrice)")
                    .font(Constants.Fonts.rankingPill)
                    .foregroundStyle(Constants.Colors.red)

                Text("Gain \(contract.value)")
                    .font(Constants.Fonts.rankingPill)
                    .foregroundStyle(Constants.Colors.lightGreen)

            }
            .padding(16)
            .frame(maxWidth: .infinity, minHeight: 98)
            .background(Constants.Colors.blackBlue)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(
                        LinearGradient(
                            gradient: Constants.Colors.gradient,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1
                    )
            )
        }
    }

    var priceSetter: some View {
        VStack(spacing: 16) {
            Text("Set a price")
                .font(Constants.Fonts.rankingPill)
                .foregroundStyle(Constants.Colors.white)

            HStack(spacing: 16) {
                Image("Money")
                    .resizable()
                    .frame(width: 64, height: 64)

                TextField("", text: $priceString, prompt: Text("-----")
                        .foregroundColor(Constants.Colors.white)
                        .font(Font.custom("LexendDeca-Bold", size: 82))

                )
                .keyboardType(.numberPad)
                .font(Font.custom("LexendDeca-Bold", size: 52))
                .foregroundStyle(Constants.Colors.white)
                .multilineTextAlignment(.center)
                .frame(width: 156)
                .onChange(of: priceString) { newValue in
                    self.price = Int(newValue)

                    if self.priceString.count > 5 {
                        self.priceString = String(self.priceString.prefix(5))
                    }

                    if self.priceString.isEmpty {
                        self.price = nil
                    }
                }
            }

            Rectangle()
                .foregroundColor(Constants.Colors.white)
                .frame(height: 1)
                .padding(.horizontal, 32)

        }
        .frame(maxWidth: .infinity)
    }

    var sellingText: some View {
        Text("When you confirm to sell, it means you’re placing this contract on the marketplace where other All In users will be able to buy it at the price you set.")
            .font(Constants.Fonts.rankingPill)
            .foregroundStyle(Constants.Colors.white)
    }

    func confirmButton(disabled: Bool) -> some View {
        Button {
            dismiss()
        } label: {
            Text("Confirm to Sell")
                .font(Constants.Fonts.rankingPill)
                .foregroundStyle(disabled ? Constants.Colors.white : Constants.Colors.black)
                .frame(maxWidth: .infinity)
                .frame(height: 64)
                .background( disabled ?
                     LinearGradient(
                         gradient: Gradient(colors: [Constants.Colors.grey03]),
                         startPoint: .topLeading,
                         endPoint: .bottomTrailing
                     ) :
                     LinearGradient(
                         gradient: Constants.Colors.gradient,
                         startPoint: .topLeading,
                         endPoint: .bottomTrailing
                     )
                )
                .cornerRadius(12)
        }
    }

}

#Preview {
    SellSelectedContractView(contract: User.dummyData[0].contracts[0], user: User.dummyData[0])
}
