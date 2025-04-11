//
//  CartItem.swift
//  All In
//
//  Created by jiwon jeong on 4/10/25.
//

import SwiftUI

struct CartItem: Identifiable {
    var id = UUID()
    var name: String
    var price: Int
    var isSelected: Bool = true
    var potentialWin: Int?
    var itemType: CartItemType
    var rarity: Rarity?
    var player: Player?
    var eventDescription: String?

    enum CartItemType {
        case rarityPack
        case marketplaceContract
    }
}
