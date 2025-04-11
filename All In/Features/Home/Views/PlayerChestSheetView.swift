//
//  PlayerChestSheetView.swift
//  All In
//
//  Created by Peter Bidoshi on 4/19/24.
//

import SwiftUI

struct PlayerChestSheetView: View {

    let name: String
    let position: String
    let number: Int

    let player: Player

    @Binding var showSheet: Bool

    @State var selectedStat: Stat = .points
    @State var activeDate: Date = Date()

    init(fromPlayer player: Player, showSheet: Binding<Bool>) {
        name = "\(player.firstName[player.firstName.startIndex]). \(player.lastName)"
        position = player.position[0]
        number = player.number
        self.player = player
        _showSheet = showSheet
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
            // The middle of the half sheet
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
                    .frame(height: 210)
            }
            } buttonCallback: {
                // TODO:
//                CartManager.shared.addMarketplaceContract(player: player, eventDescription: <#T##String#>, price: 1720, potentialWin: <#T##Int#>)
        }
        .background(Constants.Colors.background)
    }

}

#Preview {
    PlayerChestSheetView(fromPlayer: Player.dummyData[0], showSheet: .constant(true))
}
