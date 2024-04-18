//
//  ContractModel.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

struct Contract: Identifiable {
    var id: Int
    var playerNum: Int
    var metric: String
    var threshold: Int
    var payoff: Int
    var maturityDate: Date
    var contractPrice: Int
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
}

// Getting the playername
func getPlayer(_ contract: Contract) -> Player {
    Player.dummyData[contract.playerNum]!
}

// TODO: Complete this function
func convertMoney(_ money: Int) {
    //        let moneyStr = String(money)

}
