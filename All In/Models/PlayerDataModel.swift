//
//  AverageModel.swift
//  All In
//
//  Created by Daniel Chuang on 4/14/24.
//

import Foundation

struct PlayerData {
    var id: Int
    var playerId: Int
    var gameDate: Date
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


extension PlayerData {
    static let dummyData = [
        PlayerData(
            id: 0,
            playerId: 0,
            gameDate: Date(),
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
        ),
        PlayerData(
            id: 1,
            playerId: 0,
            gameDate: Date(),
            opponent: "Princeton",
            played: true,
            minutes: 20,
            fieldGoalsMade: 5,
            fieldGoalsAttempted: 19,
            threePointersMade: 22,
            threePointersAttempted: 25,
            freeThrowsMade: 4,
            freeThrowsAttempted: 13,
            rebounds: 1,
            assists: 2,
            steals: 58,
            blocks: 40,
            turnovers: 2,
            personalFouls: 55,
            points: 90
        ),
        PlayerData(
            id: 2,
            playerId: 0,
            gameDate: Date(),
            opponent: "Harvard",
            played: true,
            minutes: 25,
            fieldGoalsMade: 2,
            fieldGoalsAttempted: 22,
            threePointersMade: 225,
            threePointersAttempted: 215,
            freeThrowsMade: 42,
            freeThrowsAttempted: 132,
            rebounds: 10,
            assists: 22,
            steals: 58,
            blocks: 40,
            turnovers: 2,
            personalFouls: 55,
            points: 90
        ),
        PlayerData(
            id: 3,
            playerId: 0,
            gameDate: Date(),
            opponent: "Harvard",
            played: false,
            minutes: 25,
            fieldGoalsMade: 2,
            fieldGoalsAttempted: 22,
            threePointersMade: 225,
            threePointersAttempted: 215,
            freeThrowsMade: 42,
            freeThrowsAttempted: 132,
            rebounds: 10,
            assists: 22,
            steals: 58,
            blocks: 40,
            turnovers: 2,
            personalFouls: 55,
            points: 90
        )
    ]
}
