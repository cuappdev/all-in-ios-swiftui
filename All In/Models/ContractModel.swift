//
//  ContractModel.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

struct Contract: Identifiable {
    var id = UUID()
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
            playerNum: 30,
            metric: "rebounds",
            threshold: 4,
            payoff: 3200,
            maturityDate: dateFormatter.date(from: "03/26")!,
            contractPrice: 1720
        ),
        Contract(
            playerNum: 1,
            metric: "points",
            threshold: 15,
            payoff: 5400,
            maturityDate: dateFormatter.date(from: "03/26")!,
            contractPrice: 2470
        ),
        Contract(
            playerNum: 2,
            metric: "assists",
            threshold: 4,
            payoff: 2900,
            maturityDate: dateFormatter.date(from: "03/26")!,
            contractPrice: 1230
        ),
        Contract(
            playerNum: 3,
            metric: "blocks",
            threshold: 2,
            payoff: 8000,
            maturityDate: dateFormatter.date(from: "03/26")!,
            contractPrice: 4030
        ),
        Contract(
            playerNum: 5,
            metric: "steals",
            threshold: 2,
            payoff: 6700,
            maturityDate: dateFormatter.date(from: "03/26")!,
            contractPrice: 3890
        ),
        Contract(
            playerNum: 10,
            metric: "rebounds",
            threshold: 3,
            payoff: 1000,
            maturityDate: dateFormatter.date(from: "03/26")!,
            contractPrice: 2000
        )

    ]
}
