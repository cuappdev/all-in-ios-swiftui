//
//  ActiveBetCard.swift
//  All In
//
//  Created by jiwon jeong on 4/3/25.
//

import SwiftUI

struct ActiveBetCard: View {

    // MARK: - Properties

    let contract: Contract
    let player: Player
    @State private var showSheet = false

    init(contract: Contract) {
        self.contract = contract
        self.player = Contract.getPlayer(contract)
    }

    // MARK: - UI

    var body: some View {
        Button {
            showSheet = true
        } label: {
            HStack(spacing: 16) {
                // Player image
                Image("Player\(player.number)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 4) {
                    Text("\(player.firstName) \(player.lastName) v. \(contract.opposingTeam.capitalized)")
                        .font(Constants.Fonts.sheetBuy)
                        .foregroundStyle(Constants.Colors.white)
                        .lineLimit(1)

                    Text("\(Date().monthDayFormat) | Men's Basketball")
                        .font(Constants.Fonts.betsSubtitle)
                        .foregroundStyle(Constants.Colors.white)

                    Text("\(contract.eventThreshold) \(contract.event)")
                        .font(Constants.Fonts.betsSubtitle)
                        .foregroundStyle(Constants.Colors.white)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 4) {
                    Text("Cost: \(contract.buyPrice)")
                        .font(Constants.Fonts.caption)
                        .foregroundStyle(Constants.Colors.redChart)

                    Text("Gain: \(contract.value)")
                        .font(Constants.Fonts.caption)
                        .foregroundStyle(Constants.Colors.moneyGreen)
                }
            }
            .padding(16)
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
        .sheet(isPresented: $showSheet) {
            PlayerChestSheetView(fromPlayer: player, showSheet: $showSheet)
                .presentationDetents([.fraction(0.6)])
        }
    }
}

#Preview {
    ActiveBetCard(contract: Contract.dummyData[0])
        .background(Constants.Colors.background)
}
