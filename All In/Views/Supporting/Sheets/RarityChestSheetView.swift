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

    var body: some View {
        SheetView(title: "\(rarity.rawValue) Chest", subTitle: "", description: "Contains a \(rarity.rawValue) contract", buttonText: "Buy Now", showSheet: $showSheet) {
            // The middle of the half sheet
            rarity.getChestImage()
                .resizable()
                .frame(width: 112, height: 96)
        } buttonCallback: {
            print("BUY CHEST NETWORKING CALL HERE")
        }
    }

}
