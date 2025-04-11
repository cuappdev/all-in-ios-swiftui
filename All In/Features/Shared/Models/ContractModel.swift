//
//  ContractModel.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

struct Contract: Identifiable, Codable {

    var id: Int
    var buyPrice: Int
    var rarity: Rarity
    var opposingTeam: String
    var event: String
    var eventThreshold: Int
    var creationTime: Date
    var value: Int
    var expirationTime: Date
    var expired: Bool?
    var forSale: Bool
    var sellPrice: Int?
    var playerId: Int
    var ownerUid: Int

}

enum Rarity: String, Codable {

    case common
    case rare
    case epic
    case legendary

    enum CodingKeys: String, CodingKey {
        case common = "COMMON"
        case rare = "RARE"
        case epic = "EPIC"
        case legendary = "LEGENDARY"
    }

    var string: String {
        switch self {
        case .common:
            return "Common"
        case .rare:
            return "Rare"
        case .epic:
            return "Epic"
        case .legendary:
            return "Legendary"
        }
    }

    func getChestImage() -> Image {
        switch self {
        case .common:
            return Image("CommonChest")
        case .rare:
            return Image("RareChest")
        case .epic:
            return Image("EpicChest")
        case .legendary:
            return Image("LegendaryChest")
        }
    }

    func getPackImage() -> Image {
        switch self {
        case .common:
            return Image("common")
        case .rare:
            return Image("rare")
        case .epic:
            return Image("epic")
        case .legendary:
            return Image("legendary")
        }
    }

    func getColor() -> Color {
        switch self {
        case .common:
            return Constants.Colors.blue
        case .rare:
            return Constants.Colors.green
        case .epic:
            return Constants.Colors.purple
        case .legendary:
            return Constants.Colors.yellow
        }
    }

    static func getRandom() -> Rarity {
        let rand = Int.random(in: 0...3)
        switch rand {
        case 0:
            return Rarity.common
        case 1:
            return Rarity.rare
        case 2:
            return Rarity.epic
        case 3:
            return Rarity.legendary
        default:
            return Rarity.common
        }
    }
}

extension Contract {
    static let dummyData = [
        Contract(
            id: 0,
            buyPrice: 1000,
            rarity: Rarity.common,
            opposingTeam: "Columbia",
            event: "FGA",
            eventThreshold: 4,
            creationTime: Date().addingTimeInterval(-100000),
            value: 2400,
            expirationTime: Date(),
            forSale: true,
            playerId: 0,
            ownerUid: 0
        ),
        Contract(
            id: 1,
            buyPrice: 1400,
            rarity: Rarity.common,
            opposingTeam: "Harvard",
            event: "FGA",
            eventThreshold: 4,
            creationTime: Date().addingTimeInterval(-100000),
            value: 1600,
            expirationTime: Date(),
            forSale: true,
            playerId: 1,
            ownerUid: 0
        ),
        Contract(
            id: 2,
            buyPrice: 1000,
            rarity: Rarity.common,
            opposingTeam: "Princeton",
            event: "FGA",
            eventThreshold: 4,
            creationTime: Date().addingTimeInterval(-100000),
            value: 2400,
            expirationTime: Date(),
            forSale: true,
            playerId: 2,
            ownerUid: 0
        ),
        Contract(
            id: 3,
            buyPrice: 1000,
            rarity: Rarity.common,
            opposingTeam: "Dartmouth",
            event: "FGA",
            eventThreshold: 4,
            creationTime: Date().addingTimeInterval(-100000),
            value: 2400,
            expirationTime: Date(),
            forSale: true,
            playerId: 3,
            ownerUid: 0
        ),
        Contract(
            id: 4,
            buyPrice: 1000,
            rarity: Rarity.common,
            opposingTeam: "Harvard",
            event: "FGA",
            eventThreshold: 4,
            creationTime: Date().addingTimeInterval(-100000),
            value: 2400,
            expirationTime: Date().addingTimeInterval(-20000),
            forSale: true,
            playerId: 2,
            ownerUid: 0
        ),
        Contract(
            id: 5,
            buyPrice: 1000,
            rarity: Rarity.common,
            opposingTeam: "Harvard",
            event: "FGA",
            eventThreshold: 4,
            creationTime: Date().addingTimeInterval(-100000),
            value: 2400,
            expirationTime: Date().addingTimeInterval(100000),
            forSale: true,
            playerId: 1,
            ownerUid: 0
        )
    ]

    // Getting the playername
    static func getPlayer(_ contract: Contract) -> Player {
        Player.dummyData
            .filter { $0.id == contract.playerId }[0]
    }
}
