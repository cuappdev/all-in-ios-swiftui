//
//  BetCard.swift
//  All In
//
//  Created by Hsia Lu wu on 3/23/25.
//

import SwiftUI

struct BetCard: View {

    @State private var contract: Contract
    @State private var player: Player

    init(contract: Contract) {
        _contract = State(initialValue: contract)
        _player = State(initialValue: Contract.getPlayer(contract))
    }

    var body: some View {
            // info
        HStack(alignment: .center) {
                // player image
                Image("Player\(player.number)")
                    .resizable()
                    .frame(width: 37, height: 37)

                // info
            VStack(alignment: .leading) {
                    Text("\(Contract.getPlayer(contract).firstName) \(Contract.getPlayer(contract).lastName) v. \(contract.opposingTeam)")
                        .font(.system(size: 16))
                        .foregroundStyle(Constants.Colors.white)

                    // TODO: missing date and sport field for contracts
                    Text("\(Date().monthDayFormat) | Men's Ice Hockey")
                        .font(.system(size: 12))
                        .foregroundStyle(Constants.Colors.white)

                    // TODO: event
                    Text("\(contract.event)")
                        .font(.system(size: 12))
                        .foregroundStyle(Constants.Colors.white)
                }

                VStack {
                    Text("Cost: \(contract.buyPrice)")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(Constants.Colors.orange)

                    Text("Gain: \(contract.value)")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(Constants.Colors.lightGreen)
                }
        }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .background(Constants.Colors.blackBlue)
            .cornerRadius(16)
            // Card border
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(LinearGradient(gradient: Constants.Colors.gradient, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
            )
            .padding(.horizontal, 24)
    }
}

#Preview {
    BetCard(contract: Contract.dummyData[0])
}
