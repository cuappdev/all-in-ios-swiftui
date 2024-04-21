//
//  AverageModel.swift
//  All In
//
//  Created by Daniel Chuang on 4/14/24.
//

import Foundation

enum Stat {

    case fieldGoalsMade
    case fieldGoalsAttempted
    case threePointersMade
    case threePointersAttempted
    case freeThrowsMade
    case freeThrowsAttempted
    case rebounds
    case assists
    case steals
    case blocks
    case turnovers
    case personalFouls
    case points

    func getName() -> String {
        switch self {
        case .fieldGoalsMade:
            return "Field Goals Made"
        case .fieldGoalsAttempted:
            return "Field Goals Attempted"
        case .threePointersMade:
            return "Three Pointers Made"
        case .threePointersAttempted:
            return "Three Pointers Attempted"
        case .freeThrowsMade:
            return "Free Throws Made"
        case .freeThrowsAttempted:
            return "Free Throws Attempted"
        case .rebounds:
            return "Rebounds"
        case .assists:
            return "Assists"
        case .steals:
            return "Steals"
        case .blocks:
            return "Blocks"
        case .turnovers:
            return "Turnovers"
        case .personalFouls:
            return "Personal Fouls"
        case .points:
            return "Points"
        }
    }

    func getAbv() -> String {
        switch self {
        case .fieldGoalsMade:
            return "FGM"
        case .fieldGoalsAttempted:
            return "FGA"
        case .threePointersMade:
            return "3PM"
        case .threePointersAttempted:
            return "3PA"
        case .freeThrowsMade:
            return "FTM"
        case .freeThrowsAttempted:
            return "FTA"
        case .rebounds:
            return "Reb"
        case .assists:
            return "Ast"
        case .steals:
            return "Stl"
        case .blocks:
            return "Blk"
        case .turnovers:
            return "TO"
        case .personalFouls:
            return "PF"
        case .points:
            return "Pts"
        }
    }

    static func getAll() -> [Stat] {
        return [.fieldGoalsMade, .fieldGoalsAttempted, .threePointersMade, .threePointersAttempted, .freeThrowsMade, .freeThrowsAttempted, .rebounds, .assists, .steals, .blocks, .turnovers, .personalFouls, .points]
    }

    static func getAllAbv() -> [String] {
        return ["FGM", "FGA", "3PM", "3PA", "FTM", "FTA", "Reb", "Ast", "Stl", "Blk", "TO", "PF", "Pts"]
    }

}

struct PlayerData: Identifiable, Codable, Hashable {

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

    func getNumberFromStat(_ stat: Stat) -> Int {
        switch stat {
        case .fieldGoalsMade:
            return fieldGoalsMade
        case .fieldGoalsAttempted:
            return fieldGoalsAttempted
        case .threePointersMade:
            return threePointersMade
        case .threePointersAttempted:
            return threePointersAttempted
        case .freeThrowsMade:
            return freeThrowsMade
        case .freeThrowsAttempted:
            return freeThrowsAttempted
        case .rebounds:
            return rebounds
        case .assists:
            return assists
        case .steals:
            return steals
        case .blocks:
            return blocks
        case .turnovers:
            return turnovers
        case .personalFouls:
            return personalFouls
        case .points:
            return points
        }
    }

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
            gameDate: Date().addingTimeInterval(-86400),
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
            points: 24
        ),
        PlayerData(
            id: 2,
            playerId: 0,
            gameDate: Date().addingTimeInterval(-172800),
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
            points: 50
        ),
        PlayerData(
            id: 3,
            playerId: 0,
            gameDate: Date().addingTimeInterval(-259200),
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
            points: 35
        ),
        PlayerData(
            id: 4,
            playerId: 0,
            gameDate: Date().addingTimeInterval(-259200 - 86400),
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
            points: 30
        ),
        PlayerData(
            id: 5,
            playerId: 0,
            gameDate: Date().addingTimeInterval(-259200 - 172800),
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
            points: 20
        )
    ]

}
