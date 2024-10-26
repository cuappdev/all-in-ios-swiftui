//
//  MarketplaceViewModel.swift
//  All In
//
//  Created by Caitlyn Jin on 10/26/24.
//

import Foundation

extension MarketplaceView {

    /// The ViewModel for the Report page view.
    @MainActor
    class ViewModel: ObservableObject {

        // MARK: - Properties

        @Published var searchText: String = ""
        @Published private var selectedRarity: Rarity?

        var filteredContracts: [Contract] {
            let query = searchText.lowercased()
            return Contract.dummyData.filter { contract in
                guard let player = Player.dummyData.first(where: { $0.id == contract.playerId }) else {
                    return false
                }
                let playerName = "\(player.firstName) \(player.lastName)".lowercased()

                return (searchText.isEmpty ||
                    playerName.contains(query) ||
                    player.hometown.lowercased().contains(query) ||
                    contract.opposingTeam.lowercased().contains(query) ||
                    contract.event.lowercased().contains(query) ||
                    "\(contract.eventThreshold)".contains(searchText)) &&
                    (selectedRarity == nil || contract.rarity == selectedRarity)
            }
        }

    }

}
