//
//  ContractEndingCard.swift
//  All In
//
//  Created by Angelina Chen on 4/10/25.
//

import SwiftUI

struct ContractEndingCard: View {

    private var contract: Contract
    private var player: Player

    @State private var showSheet = false

    init(contract: Contract) {
        self.contract = contract
        self.player = Contract.getPlayer(contract)
    }

    var body: some View {
        Button {
            showSheet = true
        } label: {
            HStack(spacing: 10) {
                Image("Player\(player.number)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.leading, 12)

                VStack(alignment: .leading, spacing: 4) {
                    Text("\(player.firstName) \(player.lastName) v. \(contract.opposingTeam)")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                            .lineLimit(1)
                            .truncationMode(.tail)

                    // TODO: No sport associated with a player, temporary holder sport for now
                    Text("\(Date().monthDayFormat) |  Men's Basketball")
                        .font(.system(size: 12))
                        .foregroundColor(.black.opacity(0.8))
                        .lineLimit(1)
                        .truncationMode(.tail)

                    Text(contract.event)
                        .font(.system(size: 12))
                        .foregroundColor(.black.opacity(0.8))
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text("Cost: \(contract.buyPrice, specifier: "%.2f")")
                        .foregroundColor(Constants.Colors.red)
                        .font(.system(size: 12, weight: .bold))

                    Text("Gain: \(contract.value, specifier: "%.2f")")
                        .foregroundColor(Constants.Colors.lightGreen)
                        .font(.system(size: 12, weight: .bold))
                }
                .padding(.trailing, 12)
            }
            .frame(height: 90)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Constants.Colors.gradientBlue, Constants.Colors.gradientLightBlue,
                                                Constants.Colors.gradientLavender, Constants.Colors.gradientPurple]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(12)
            .padding(.horizontal, 8)
        }
        .sheet(isPresented: $showSheet) {
            PlayerContractSheetView(fromPlayer: player, fromStat: Stat.assists, showSheet: $showSheet)
                .presentationDetents([.fraction(0.6)])
        }
    }
}

#Preview {
    ContractEndingCard(contract: Contract.dummyData[0])
}

// MARK: Components

extension ContractEndingCard {
    private var playerInfo: some View {
        HStack {
            Image("Player\(player.number)")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))

            VStack {
                Group {
                    Text("\(Contract.getPlayer(contract).firstName.prefix(1)). \(Contract.getPlayer(contract).lastName)")

                    Text("V. \(contract.opposingTeam)")
                }
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(Constants.Colors.white)
                .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 0))

                Text("\(Date().monthDayFormat) |  Men's Basketball").font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Constants.Colors.white)
                    .padding(.top, 1)
            }
        }
    }

    private var contractInfo: some View {
        VStack(spacing: 0) {
            Text("\(contract.eventThreshold) \(contract.event)")
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(Constants.Colors.white)

            Path { path in
                path.move(to: CGPoint(x: -60, y: 10))
                path.addLine(to: CGPoint(x: 60, y: 10))
            }
            .stroke(Constants.Colors.gradientBlue, style: StrokeStyle(lineWidth: 1, dash: [2]))
            .frame(width: 1, height: 1)

            Text("Cost: \(contract.buyPrice)")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(Constants.Colors.orange)
                .padding(.top, 15)

            Text("Gain: \(contract.value)")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(Constants.Colors.lightGreen)
        }
        .frame(width: 137, height: 75)
        .background(Constants.Colors.backgroundBlack)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(
                    LinearGradient(
                        gradient: Constants.Colors.gradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
        )
        .padding(.top, 16)

    }

}
