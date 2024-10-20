//
//  RarityChestSheetView.swift
//  All In
//
//  Created by Peter Bidoshi on 4/23/24.
//

import SwiftUI

struct RarityChestSheetView: View {

    let rarity: Rarity

    @Binding var showSheet: Bool

    @State var showWheelSpin = false
    @State var returnedContract: Contract? = nil

    var body: some View {
        SheetView(title: "\(rarity.rawValue) Chest", subTitle: "", description: "Contains a \(rarity.rawValue) contract", buttonText: "Buy Now", showSheet: $showSheet) {
            // The middle of the half sheet
            rarity.getChestImage()
                .resizable()
                .frame(width: 112, height: 96)
        } buttonCallback: {
            NetworkManager.shared.getRarityContract(buyPrice: 1200, rarity: rarity) { contract in
                returnedContract = contract
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    showWheelSpin = true
                }
            }
        }
        .sheet(isPresented: $showWheelSpin) {
            WheelSpinSheet(winningContract: $returnedContract)
                .presentationDetents([.fraction(0.45)])
        }

    }

}
