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
    var expired: Bool?
    var forSale: Bool
    var sellPrice: Int?
    var playerId: Int
    var ownerId: Int

}

enum Rarity: String, Codable {

    case Common
    case Rare
    case Epic
    case Legendary

    func getChestImage() -> Image {
        switch self {
            case .Common:
                return Image("CommonChest")
            case .Rare:
                return Image("RareChest")
            case .Epic:
                return Image("EpicChest")
            case .Legendary:
                return Image("LegendaryChest")
        }
    }

    func getColor() -> Color {
        switch self {
            case .Common:
                return Constants.Colors.blue
            case .Rare:
                return Constants.Colors.green
            case .Epic:
                return Constants.Colors.purple
            case .Legendary:
                return Constants.Colors.yellow
        }
    }

    static func getRandom() -> Rarity {
        let rand = Int.random(in: 0...3)
        switch rand {
            case 0:
                return Rarity.Common
            case 1:
                return Rarity.Rare
            case 2:
                return Rarity.Epic
            case 3:
                return Rarity.Legendary
        default:
            return Rarity.Common
        }
    }
}

extension Contract {
    static let dummyData = [
        Contract(
            id: 0,
            buyPrice: 1000,
            rarity: Rarity.Common,
            opposingTeam: "columbia",
            event: "FGA",
            eventThreshold: 4,
            creationTime: Date().addingTimeInterval(-100000),
            value: 2400,
            forSale: true,
            playerId: 0,
            ownerId: 0
        ),
        Contract(
            id: 1,
            buyPrice: 1400,
            rarity: Rarity.Common,
            opposingTeam: "harvard",
            event: "FGA",
            eventThreshold: 4,
            creationTime: Date().addingTimeInterval(-100000),
            value: 1600,
            forSale: true,
            playerId: 1,
            ownerId: 0
        ),
        Contract(
            id: 2,
            buyPrice: 1000,
            rarity: Rarity.Common,
            opposingTeam: "princeton",
            event: "FGA",
            eventThreshold: 4,
            creationTime: Date().addingTimeInterval(-100000),
            value: 2400,
            forSale: true,
            playerId: 2,
            ownerId: 0
        ),
        Contract(
            id: 3,
            buyPrice: 1000,
            rarity: Rarity.Common,
            opposingTeam: "dartmouth",
            event: "FGA",
            eventThreshold: 4,
            creationTime: Date().addingTimeInterval(-100000),
            value: 2400,
            forSale: true,
            playerId: 3,
            ownerId: 0
        ),
        Contract(
            id: 4,
            buyPrice: 1000,
            rarity: Rarity.Common,
            opposingTeam: "harvard",
            event: "FGA",
            eventThreshold: 4,
            creationTime: Date().addingTimeInterval(-100000),
            value: 2400,
            forSale: true,
            playerId: 2,
            ownerId: 0
        ),
        Contract(
            id: 5,
            buyPrice: 1000,
            rarity: Rarity.Common,
            opposingTeam: "harvard",
            event: "FGA",
            eventThreshold: 4,
            creationTime: Date().addingTimeInterval(-100000),
            value: 2400,
            forSale: true,
            playerId: 1,
            ownerId: 0
        )
    ]

    // Getting the playername
    static func getPlayer(_ contract: Contract) -> Player {
        Player.dummyData
            .filter { $0.id == contract.playerId }[0]
    }
}
