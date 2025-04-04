//
//  RarityPackSheetViewModel.swift
//  All In
//
//  Created by jiwon jeong on 4/3/25.
//

import Foundation

extension RarityPackSheetView {

    @MainActor

    class ViewModel: ObservableObject {
        // MARK: - Properties

        @Published var returnedContract: Contract?
        @Published var showWheelSpin = false

        // MARK: - Requests

        func getRarityContract(rarity: Rarity) {
            NetworkManager.shared.getRarityContract(buyPrice: 1200, rarity: rarity) { contract in
                self.returnedContract = contract

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) { [self] in
                    showWheelSpin = true
                }
            }
        }
    }
}
