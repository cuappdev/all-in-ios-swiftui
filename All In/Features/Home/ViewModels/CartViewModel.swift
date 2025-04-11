//
//  CartViewModel.swift
//  All In
//
//  Created by jiwon jeong on 4/10/25.
//

import SwiftUI
import Combine

class CartViewModel: ObservableObject {
    @Published var homeItems: [CartItem] = []
    @Published var marketplaceItems: [CartItem] = []
    let user: User

    private var cartManager: CartManager

    private var cancellables = Set<AnyCancellable>()

    var homeTotalAmount: Int {
        homeItems.filter { $0.isSelected }.reduce(0) { $0 + $1.price }
    }

    var marketplaceTotalAmount: Int {
        marketplaceItems.filter { $0.isSelected }.reduce(0) { $0 + $1.price }
    }

    var potentialWinnings: Int {
        marketplaceItems.filter { $0.isSelected }.reduce(0) { $0 + ($1.potentialWin ?? 0) }
    }

    var totalAmount: Int {
        homeTotalAmount + marketplaceTotalAmount
    }

    init(user: User) {
        self.user = user
        self.cartManager = CartManager.shared

        let manager = cartManager

        self.homeItems = manager.homeItems
        self.marketplaceItems = manager.marketplaceItems

        // Subscribe to future changes
        manager.$homeItems
            .sink { [weak self] items in
                self?.homeItems = items
            }
            .store(in: &cancellables)

        manager.$marketplaceItems
            .sink { [weak self] items in
                self?.marketplaceItems = items
            }
            .store(in: &cancellables)

    }

    func confirmPurchase() {
        // TODO: add like purchasing logic
        let cartManager = cartManager
        // Remove the selected items from the cart manager
        for item in homeItems.filter({ $0.isSelected }) {
            cartManager.removeItem(id: item.id)
        }

        for item in marketplaceItems.filter({ $0.isSelected }) {
            cartManager.removeItem(id: item.id)
        }

    }

    func toggleItemSelection(item: CartItem) {
        if let index = homeItems.firstIndex(where: { $0.id == item.id }) {
            homeItems[index].isSelected.toggle()
        } else if let index = marketplaceItems.firstIndex(where: { $0.id == item.id }) {
            marketplaceItems[index].isSelected.toggle()
        }
    }

}
