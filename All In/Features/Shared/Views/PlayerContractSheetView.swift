//
//  PlayerContractSheetView.swift
//  All In
//
//  Created by Antoinette Marie Torres on 4/21/24.
//

import SwiftUI

struct PlayerContractSheetView: View {

    let name: String
    let position: String
    let number: Int
    let stat: Stat
    let contract: Contract

    let player: Player

    @Binding var showSheet: Bool

    @State var selectedStat: Stat = .points
    @State var activeDate: Date = Date()

    init(fromPlayer player: Player, fromContract contract: Contract, fromStat stat: Stat, showSheet: Binding<Bool>) {
        name = "\(player.firstName[player.firstName.startIndex]). \(player.lastName)"
        position = player.position[0]
        number = player.number
        self.player = player
        _showSheet = showSheet
        self.stat = stat
        self.contract = contract
    }

    var body: some View {
            SheetView(
                title: name,
                subTitle: "#\(number) | \(position)",
                description: "Contains a contract involving \(name)",
                buttonText: "Add to Cart",
                price: 1720,
                showSheet: $showSheet
            ) {
                VStack(alignment: .leading) {
                    PillSelectView(Stat.getAll()) { newStat in
                        selectedStat = newStat
                    }
                    .padding(EdgeInsets(top: 0, leading: -24, bottom: 0, trailing: -24))

                    Text(selectedStat.getName())
                        .foregroundColor(Constants.Colors.white)
                        .font(.system(size: 24, weight: .bold))

                        player.graph(stat: selectedStat, selectedDate: activeDate) { strDate in
                            // ON DRAG COMPLETION HANDLER
                            activeDate = Date(timeIntervalSinceReferenceDate: TimeInterval(strDate))
                        }
                }
                .background(Constants.Colors.background)
            } buttonCallback: {
                // TODO: what shoule potential win
                CartManager.shared.addMarketplaceContract(player: player, eventDescription: contract.event, price: contract.buyPrice, potentialWin: 1)
        }
        .background(Constants.Colors.background)
        }

}

#Preview {
    PlayerContractSheetView(fromPlayer: Player.dummyData[0], fromContract: Contract.dummyData[0], fromStat: Stat.fieldGoalsMade, showSheet: .constant(true))
}
