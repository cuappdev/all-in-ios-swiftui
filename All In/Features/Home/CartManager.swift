//
//  CartManager.swift
//  All In
//
//  Created by jiwon jeong on 4/10/25.
//
//

import SwiftUI
import Combine

class CartManager: ObservableObject {
    @Published var homeItems: [CartItem] = []
    @Published var marketplaceItems: [CartItem] = []
    @Published var showCart: Bool = false

    static let shared = CartManager()

    private init() {}

    func addRarityPack(rarity: Rarity, price: Int) {
        let item = CartItem(
            name: "\(rarity.string)",
            price: price,
            itemType: .rarityPack,
            rarity: rarity
        )
        homeItems.append(item)
    }

    func addMarketplaceContract(player: Player, eventDescription: String, price: Int, potentialWin: Int) {
        let item = CartItem(
            name: "\(player.firstName.prefix(1)). \(player.lastName)",
            price: price,
            potentialWin: potentialWin,
            itemType: .marketplaceContract,
            player: player,
            eventDescription: eventDescription
        )
        marketplaceItems.append(item)
    }

    func clearCart() {
        homeItems.removeAll()
        marketplaceItems.removeAll()
    }

    func removeItem(id: UUID) {
        homeItems.removeAll(where: { $0.id == id })
        marketplaceItems.removeAll(where: { $0.id == id })
    }
}
