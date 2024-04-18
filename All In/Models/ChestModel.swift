//
//  ChestModel.swift
//  All In
//
//  Created by Peter Bidoshi on 4/16/24.
//

protocol Chest {

    var type: ChestType { get }
    var price: Double { get }

}

enum ChestType {

    case player
    case rarity

}

struct RarityChest: Chest {

    var type: ChestType = ChestType.rarity
    var price: Double
    var rarity: Rarity

    enum Rarity: String {
        case common = "Common"
        case rare = "Rare"
        case epic = "Epic"
        case legendary = "Legendary"
    }

}

struct PlayerChest: Chest {

    var type: ChestType = ChestType.player
    var price: Double
    var player: Player

}

extension RarityChest {

    static let dummyData = [
        RarityChest(price: 1720, rarity: Rarity.common),
        RarityChest(price: 2470, rarity: Rarity.rare),
        RarityChest(price: 1230, rarity: Rarity.epic),
        RarityChest(price: 3200, rarity: Rarity.legendary)
    ]

}

extension PlayerChest {

    static let dummyData = [
        PlayerChest(price: 1720, player: Player.dummyData[0]),
        PlayerChest(price: 2470, player: Player.dummyData[1]),
        PlayerChest(price: 1230, player: Player.dummyData[2]),
        PlayerChest(price: 3200, player: Player.dummyData[3])
    ]
}
