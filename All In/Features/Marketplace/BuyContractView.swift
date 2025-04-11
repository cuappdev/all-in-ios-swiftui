//
//  BuyContractView.swift
//  All In
//
//  Created by Angelina Chen on 4/10/25.
//

import SwiftUI

struct BuyContractView: View {
//    let contracts: [Contract]
    let contract: Contract
    let player: Player
    let user: User

    @Environment(\.dismiss) private var dismiss
    @State private var price: Int?
    @State private var priceString: String = ""
    @State private var showSheet = false

    init(contract: Contract, user: User) {
        self.contract = contract
        self.player = Contract.getPlayer(contract)
        self.user = user
    }

    var body: some View {
        VStack {
            headingCostGain

            Spacer()

            historicalData
                .padding(.bottom)

            chartInformation

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
            .padding(.top, 10)
        }
    }

    var historicalData: some View {
        VStack {
            Button {
                showSheet = true
            } label: {
                VStack(alignment: .center, spacing: 4) {
                    Text("Click to see historical data")
                        .font(Constants.Fonts.rankingPill)
                        .foregroundStyle(Constants.Colors.white)
                }
                .padding(16)
                .frame(maxWidth: .infinity, minHeight: 38)
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
                .sheet(isPresented: $showSheet) {
                    PlayerContractSheetView(fromPlayer: player, fromContract: contract, fromStat: Stat.assists, showSheet: $showSheet)
                        .presentationDetents([.fraction(0.8)])
                }
            }
        }
    }

    var chartInformation: some View {
        BuyContractChart(stats: [
            StatLine(label: "24–25", games: 33, pts: 6.6, trb: 3.7, ast: 1.3),
            StatLine(label: "Career", games: 116, pts: 9.9, trb: 3.8, ast: 2.1)
        ])
    }

    func confirmButton(disabled: Bool) -> some View {
        Button {
            dismiss()
        } label: {
            Text("Confirm to Buy")
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
    BuyContractView(contract: User.dummyData[0].contracts[0], user: User.dummyData[0])
}
