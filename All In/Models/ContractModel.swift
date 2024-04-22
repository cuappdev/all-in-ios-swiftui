//
//  ContractModel.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

struct Contract: Identifiable, Decodable {

    var id: Int
    var buyPrice: Int
    var rarity: String
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

extension Contract {
    static let dummyData = [
        Contract(
            id: 0,
            playerNum: 30,
            metric: "rebounds",
            threshold: 4,
            payoff: 3200,
            maturityDate: dateFormatter.date(from: "03/26")!,
            contractPrice: 1720
        ),
        Contract(
            id: 1,
            playerNum: 1,
            metric: "points",
            threshold: 15,
            payoff: 5400,
            maturityDate: dateFormatter.date(from: "03/26")!,
            contractPrice: 2470
        ),
        Contract(
            id: 2,
            playerNum: 2,
            metric: "assists",
            threshold: 4,
            payoff: 2900,
            maturityDate: dateFormatter.date(from: "03/26")!,
            contractPrice: 1230
        ),
        Contract(
            id: 3,
            playerNum: 3,
            metric: "blocks",
            threshold: 2,
            payoff: 8000,
            maturityDate: dateFormatter.date(from: "03/26")!,
            contractPrice: 4030
        ),
        Contract(
            id: 4,
            playerNum: 5,
            metric: "steals",
            threshold: 2,
            payoff: 6700,
            maturityDate: dateFormatter.date(from: "03/26")!,
            contractPrice: 3890
        ),
        Contract(
            id: 5,
            playerNum: 10,
            metric: "rebounds",
            threshold: 3,
            payoff: 1000,
            maturityDate: dateFormatter.date(from: "03/26")!,
            contractPrice: 2000
        )

    ]

    // Getting the playername
    static func getPlayer(_ contract: Contract) -> Player {
        // TODO: BACKEND CALL
        Player.dummyData[0]
    }
}
