//
//  RarityChestSheetView.swift
//  All In
//
//  Created by Peter Bidoshi on 4/23/24.
//

import SwiftUI

struct RarityChestSheetView: View {

    @StateObject private var viewModel = ViewModel()
    @Binding var showSheet: Bool

    let rarity: Rarity

    var body: some View {
        SheetView(
            title: "\(rarity.string) Chest",
            subTitle: "",
            description: "Contains a \(rarity.string) contract",
            buttonText: "Buy Now",
            price: 1720,
            showSheet: $showSheet
        ) {
            // The middle of the half sheet
            rarity.getChestImage()
                .resizable()
                .frame(width: 112, height: 96)
        } buttonCallback: {
            viewModel.getRarityContract(rarity: rarity)
        }
        .sheet(isPresented: $viewModel.showWheelSpin) {
            WheelSpinSheet(winningContract: $viewModel.returnedContract)
                .presentationDetents([.fraction(0.45)])
        }

    }

}

#Preview{
    RarityChestSheetView(showSheet: .constant(true), rarity: .common)
}

