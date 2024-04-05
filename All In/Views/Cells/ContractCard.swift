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
        _player = State(initialValue: getPlayer(contract))
    }

    var body: some View {
        VStack {
            ZStack {
                Constants.Colors.white.ignoresSafeArea()

                // Card Content VStack
                VStack {
                    // Player Image
                    Image("Player\(player.number)")
                        .resizable()
                        .frame(width: 128, height: 160)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))

                    // Player Info
                    HStack {
                        VStack(alignment: .leading) {
                            Text(convertName(getPlayer(contract).name))
                                .font(.system(size: 10, weight: .regular))
                                .foregroundStyle(Constants.Colors.grey02)
                                .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 0))
                            Text("\(contract.threshold) \(contract.metric)")
                                .font(.system(size: 16, weight: .bold))
                        }

                        Spacer()

                        VStack(alignment: .trailing, spacing: 0) {
                            Text("exp. \(dateFormatter.string(from: contract.maturityDate))")
                                .font(.system(size: 10, weight: .regular))
                                .foregroundStyle(Constants.Colors.grey02)
                            Spacer()
                        }
                    }
                    .padding(EdgeInsets(top: 1, leading: 9, bottom: 0, trailing: 9))

                    Spacer()

                    // Buy Button
                    HStack(alignment: .center) {
                        // Purchase Button
                        Button {} label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 167, height: 29)
                                    .cornerRadius(8)
                                    .foregroundColor(Constants.Colors.red)
                                HStack {
                                    Text("BUY")
                                        .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 0))
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(Constants.Colors.white)
                                    Image("WhiteMoney")
                                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                        .foregroundStyle(Constants.Colors.white)
                                    Text("+\(contract.payoff) | -\(contract.contractPrice)")
                                        .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 12))
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundColor(Constants.Colors.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7))
                                }.frame(width: 152, height: 29)
                            }
                        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: -2, leading: 0, bottom: 8, trailing: 0))
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .inset(by: 1) // inset value should be same as lineWidth in .stroke
                    .stroke(Constants.Colors.grey01, lineWidth: 1)
            )
            .frame(width: 181, height: 254)
            .cornerRadius(16)

        }

    }

}

#Preview {
    ContractCard(contract: Contract.dummyData[1])
}
