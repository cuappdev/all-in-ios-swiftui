//
//  PlayerChestSheetView.swift
//  All In
//
//  Created by Peter Bidoshi on 4/19/24.
//

import Charts
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
        position = player.position
        number = player.number
        self.player = player
        _showSheet = showSheet
    }

    var body: some View {
        SheetView(title: name, subTitle: "#\(number) | \(position)", description: "Contains a contract tied to this player", buttonText: "Buy Now", showSheet: $showSheet) {
            VStack {
                
                player.graph(stat: selectedStat, selectedDate: activeDate) { strDate in
                    // ON DRAG COMPLETION HANDLER
                    activeDate = Date(timeIntervalSinceReferenceDate: TimeInterval(strDate))
                }

                Image("PlayerChest")
                    .resizable()
                    .frame(width: 112, height: 96)
            }
        }
    }
    
}
