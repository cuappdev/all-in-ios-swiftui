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
                Constants.Colors.grey00.ignoresSafeArea()

                // Card Content VStack
                VStack {

                    // Header
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(contract.threshold) \(contract.metric)")
                                .font(.system(size: 14, weight: .bold))
                            Text(convertName(getPlayer(contract).name))
                                .font(.system(size: 10, weight: .semibold))
                                .foregroundStyle(Constants.Colors.grey02)
                                .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 0))
                        }

                        Spacer()

                        VStack(alignment: .trailing, spacing: 0) {
                            HStack(spacing: 4) {
                                Text("\(contract.payoff)")
                                    .font(.system(size: 14, weight: .semibold))
                                Image("IconCash")
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundStyle(Constants.Colors.red)
                                    .frame(height: 13)
                            }
                            Text("exp. \(dateFormatter.string(from: contract.maturityDate))")
                                .font(.system(size: 10, weight: .semibold))
                                .foregroundStyle(Constants.Colors.grey02)
                        }
                    }
                    .padding(EdgeInsets(top: 9, leading: 9, bottom: 0, trailing: 9))

                    Spacer()

                    // Player Image
                    Image("Player\(player.number)")
                        .resizable()
                        .frame(width: 133, height: 164)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                    // Buttons for purchase and info
                    HStack(alignment: .center) {
                        // Purchase Button
                        Button {} label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 152, height: 29)
                                    .cornerRadius(7)
                                    .foregroundColor(Constants.Colors.red)
                                HStack {
                                    Text("BUY")
                                        .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 7))
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(Constants.Colors.white)
                                    Spacer()
                                    HStack(spacing: -3) {
                                        Text("\(contract.contractPrice)")
                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7))
                                            .font(.system(size: 12, weight: .semibold))
                                            .foregroundColor(Constants.Colors.white)
                                        Image("IconCash")
                                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                            .foregroundStyle(Constants.Colors.white)
                                    }
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7))
                                }.frame(width: 152, height: 29)
                            }
                        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: -2, leading: 0, bottom: 9, trailing: 0))
                }
            }
            .frame(width: 170, height: 254)
            .cornerRadius(10)

        }

    }

}

#Preview {
    ContractCard(contract: Contract.dummyData[1])
}
