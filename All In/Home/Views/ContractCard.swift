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

    var body: some View {
        Button {
            showSheet = true
        } label: {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 16)
                    .inset(by: 0.5)
                    .stroke(Constants.Colors.grey02, lineWidth: 1)
                    .frame(width: 150, height: 150)
                    .background(.white)
                    .cornerRadius(16)
                    .shadow(color: Constants.Colors.grey00, radius: 5, x: 0, y: 4)

                VStack(alignment: .center, spacing: 26) {

                    VStack {
                        ZStack {
                            Constants.Colors.white.ignoresSafeArea()

                            VStack { // Card Content VStack
                                Image("Player\(player.number)")
                                    .resizable()
                                    .frame(width: 82, height: 82)
                                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))

                                Text("\(Contract.getPlayer(contract).firstName)"
                                     + "\(Contract.getPlayer(contract).lastName)")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundStyle(Constants.Colors.grey03)
                                    .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 0))

                                Text("VS \(Date().monthDayFormat /*contract.maturityDate*/)")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundStyle(Constants.Colors.grey03)

                                HStack {
                                    VStack {
                                        Text("\(contract.eventThreshold)")
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundStyle(Constants.Colors.black)
                                        Text("\(contract.event)")
                                            .font(.system(size: 8, weight: .bold))
                                            .foregroundStyle(Constants.Colors.black)
                                    }
                                    .frame(width: 60, height: 30, alignment: .center)

                                    // Dashed line
                                    Path { path in
                                        path.move(to: CGPoint(x: 0, y: 0))
                                        path.addLine(to: CGPoint(x: 0, y: 28))
                                    }
                                    .stroke(Constants.Colors.red, style: StrokeStyle(lineWidth: 1, dash: [2]))
                                    .frame(width: 1, height: 28)

                                    Text("Cost: \(contract.buyPrice)\nGain: \(contract.value)")
                                        .font(.system(size: 10, weight: .regular))
                                        .foregroundStyle(Constants.Colors.black)
                                        .multilineTextAlignment(.trailing)
                                        .frame(width: 60, height: 30, alignment: .leading)
                                }
                                .frame(width: 146, height: 55)
                                .background(Constants.Colors.grey00)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

                            }
                            .frame(width: 181, height: 222)
                            .cornerRadius(16)
                            // Card border
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .inset(by: 1)
                                    .stroke(Constants.Colors.grey02, lineWidth: 1)
                            )
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            PlayerContractSheetView(fromPlayer: player, fromStat: Stat.assists, showSheet: $showSheet)
                .presentationDetents([.fraction(0.9)])
        }
    }
}

#Preview {
    ContractCard(contract: Contract.dummyData[0])
}
