//
//  PreviewContractCard.swift
//  All In
//
//  Created by Peter Bidoshi on 4/23/24.
//

import SwiftUI

struct PreviewContractCard: View {

    let rarity: Rarity

    var body: some View {

        ZStack {
            rarity.getColor()
                .frame(width: 181, height: 222)
                .cornerRadius(12)
        }
    }
}
