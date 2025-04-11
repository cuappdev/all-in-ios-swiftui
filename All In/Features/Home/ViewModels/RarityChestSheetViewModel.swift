//
//  RarityChestSheetViewModel.swift
//  All In
//
//  Created by Caitlyn Jin on 10/26/24.
//

import Foundation

extension RarityChestSheetView {

    @MainActor
    class ViewModel: ObservableObject {

        // MARK: - Properties

        @Published var returnedContract: Contract?
        @Published var showWheelSpin = false

        // MARK: - Requests

        func getRarityContract(rarity: Rarity) {
//            NetworkManager.shared.getRarityContract(buyPrice: 1200, rarity: rarity) { contract in
//                self.returnedContract = contract
//
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) { [self] in
//                    showWheelSpin = true
//                }
//            }
        }

    }

}
