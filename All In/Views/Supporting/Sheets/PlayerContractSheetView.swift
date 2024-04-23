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
        SheetView(title: name, subTitle: "#\(number) | \(position)", description: "Contains a contract tied to this player", buttonText: "Buy Now", showSheet: $showSheet) {
            // The middle of the half sheet
            VStack {
                HStack {
                    Text("Game Information")
                        .foregroundColor(Constants.Colors.grey03)
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 365, height: 50, alignment: .leading)
                }
                player.graph(stat: selectedStat, selectedDate: activeDate) { strDate in
                    // ON DRAG COMPLETION HANDLER
                    activeDate = Date(timeIntervalSinceReferenceDate: TimeInterval(strDate))
                }
            }
        }
    }
    
}

