//
//  ContractCard.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

struct ContractCard: View {

    @State private var contract: Contract
    @State private var player: Player

    init(contract: Contract) {
        _contract = State(initialValue: contract)
        _player = State(initialValue: Contract.getPlayer(contract))
    }

    @State var showSheet = false

    var myGradient = Gradient(
        colors: [
            Constants.Colors.gradientBlue,
            Constants.Colors.gradientLightBlue,
            Constants.Colors.gradientPurple,
            Constants.Colors.gradientLavender
        ]
    )

    var body: some View {
        Button {
            showSheet = true
        } label: {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 16)
                    .inset(by: 0.5)
                    .stroke(Constants.Colors.grey00, lineWidth: 2)
                    .frame(width: 150, height: 150)
                    .background(.white)
                    .cornerRadius(16)
                    .shadow(color: Constants.Colors.grey00, radius: 5, x: 0, y: 4)

                VStack(alignment: .center, spacing: 26) {
                    VStack {
                        ZStack {
                            Constants.Colors.backgroundBlack.ignoresSafeArea()

                            VStack { // Card Content VStack
                                playerInfo

                                // event and cost/gain info
                                contractInfo

                            }
                            .frame(width: 181, height: 222)
                            .background(Constants.Colors.blackBlue)
                            .cornerRadius(16)
                            // Card border
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .inset(by: 1)
                                    .stroke(LinearGradient(gradient: myGradient, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                            )
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            PlayerContractSheetView(fromPlayer: player, fromStat: Stat.assists, showSheet: $showSheet)
                .presentationDetents([.fraction(0.6)])
        }
    }
}

#Preview {
    ContractCard(contract: Contract.dummyData[0])
}

// MARK: Components
extension ContractCard {
    private var playerInfo: some View {
        HStack {
            // Player Image and Name
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

            // Dashed line
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
                .stroke(LinearGradient(gradient: myGradient, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
        )
        .padding(.top, 16)
        // Card border

    }

}
