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

//                GeometryReader { geo in
                    player.graph(stat: selectedStat, selectedDate: activeDate) { strDate in
                        // ON DRAG COMPLETION HANDLER
                        activeDate = Date(timeIntervalSinceReferenceDate: TimeInterval(strDate))
                    }
                    .frame(height: 210)
//                }
            }
            } buttonCallback: {
                // TODO: add networking call
                print("BUY CHEST NETWORKING CALL HERE")
        }
        .background(Constants.Colors.background)
    }

}

#Preview {
    PlayerChestSheetView(fromPlayer: Player.dummyData[0], showSheet: .constant(true))
}
