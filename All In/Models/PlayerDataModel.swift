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
    var gameDate: Date
    var opponent: String
    var played: Bool
    var points: Int
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
    var playerId: Int

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
            gameDate: Date(),
            opponent: "Columbia",
            played: true,
            points: 40,
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
            playerId: 40
        ),
        PlayerData(
            id: 1,
            gameDate: Date().addingTimeInterval(-86400),
            opponent: "Harvard",
            played: true,
            points: 46,
            minutes: 50,
            fieldGoalsMade: 25,
            fieldGoalsAttempted: 2,
            threePointersMade: 22,
            threePointersAttempted: 225,
            freeThrowsMade: 215,
            freeThrowsAttempted: 42,
            rebounds: 132,
            assists: 10,
            steals: 22,
            blocks: 58,
            turnovers: 40,
            personalFouls: 2,
            playerId: 55
        ),
        PlayerData(
            id: 2,
            gameDate: Date().addingTimeInterval(-172800),
            opponent: "Princeton",
            played: false,
            points: 15,
            minutes: 0,
            fieldGoalsMade: 0,
            fieldGoalsAttempted: 0,
            threePointersMade: 0,
            threePointersAttempted: 0,
            freeThrowsMade: 0,
            freeThrowsAttempted: 0,
            rebounds: 0,
            assists: 0,
            steals: 0,
            blocks: 0,
            turnovers: 0,
            personalFouls: 0,
            playerId: 0
        ),
        PlayerData(
            id: 3,
            gameDate: Date().addingTimeInterval(-172800 - 86400),
            opponent: "Princeton",
            played: false,
            points: 10,
            minutes: 0,
            fieldGoalsMade: 0,
            fieldGoalsAttempted: 0,
            threePointersMade: 0,
            threePointersAttempted: 0,
            freeThrowsMade: 0,
            freeThrowsAttempted: 0,
            rebounds: 0,
            assists: 0,
            steals: 0,
            blocks: 0,
            turnovers: 0,
            personalFouls: 0,
            playerId: 0
        ),
        PlayerData(
            id: 4,
            gameDate: Date().addingTimeInterval(-172800 - 172800),
            opponent: "Princeton",
            played: false,
            points: 13,
            minutes: 0,
            fieldGoalsMade: 0,
            fieldGoalsAttempted: 0,
            threePointersMade: 0,
            threePointersAttempted: 0,
            freeThrowsMade: 0,
            freeThrowsAttempted: 0,
            rebounds: 0,
            assists: 0,
            steals: 0,
            blocks: 0,
            turnovers: 0,
            personalFouls: 0,
            playerId: 0
        ),
        PlayerData(
            id: 5,
            gameDate: Date().addingTimeInterval(-172800 - 172800 - 86400),
            opponent: "Princeton",
            played: false,
            points: 23,
            minutes: 0,
            fieldGoalsMade: 0,
            fieldGoalsAttempted: 0,
            threePointersMade: 0,
            threePointersAttempted: 0,
            freeThrowsMade: 0,
            freeThrowsAttempted: 0,
            rebounds: 0,
            assists: 0,
            steals: 0,
            blocks: 0,
            turnovers: 0,
            personalFouls: 0,
            playerId: 0
        ),
        PlayerData(
            id: 6,
            gameDate: Date().addingTimeInterval(-172800 - 172800 - 172800),
            opponent: "Princeton",
            played: false,
            points: 34,
            minutes: 0,
            fieldGoalsMade: 0,
            fieldGoalsAttempted: 0,
            threePointersMade: 0,
            threePointersAttempted: 0,
            freeThrowsMade: 0,
            freeThrowsAttempted: 0,
            rebounds: 0,
            assists: 0,
            steals: 0,
            blocks: 0,
            turnovers: 0,
            personalFouls: 0,
            playerId: 0
        )
    ]

}
