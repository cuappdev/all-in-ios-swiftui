//
//  AveragesModel.swift
//  All In
//
//  Created by Daniel Chuang on 4/14/24.
//


struct PlayerAverages {
    var id: Int
    var playerId: Int
    var opponent: String
    var played: Bool
    var minutes: Int
    var fieldGoalsMade: Int
    var fieldGoalsAttempted: Int
    var threePointersMade: Int
    var threePointersAttempted: Int
    var freeThrowsMade: Int
    var freeThrowsAttempted: Int
    var rebounds: Int
    var assists: Int
    var steals: Int
    var blocks: Int
    var turnovers: Int
    var personalFouls: Int
    var points: Int
}

extension PlayerAverages {
    static let dummyData = [
        PlayerAverages(
            id: 0,
            playerId: 0,
            opponent: "Columbia",
            played: true,
            minutes: 50,
            fieldGoalsMade: 2,
            fieldGoalsAttempted: 12,    
            threePointersMade: 18,
            threePointersAttempted: 20,
            freeThrowsMade: 2,
            freeThrowsAttempted: 10,
            rebounds: 4,
            assists: 5,
            steals: 50,
            blocks: 20,
            turnovers: 1,
            personalFouls: 50,
            points: 40
        )
    ]
}
