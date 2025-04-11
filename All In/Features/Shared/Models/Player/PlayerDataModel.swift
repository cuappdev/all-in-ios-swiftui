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
        [
            .fieldGoalsMade,
            .fieldGoalsAttempted,
            .threePointersMade,
            .threePointersAttempted,
            .freeThrowsMade,
            .freeThrowsAttempted,
            .rebounds,
            .assists,
            .steals,
            .blocks,
            .turnovers,
            .personalFouls,
            .points
        ]
    }

    static func getAllAbv() -> [String] {
        [
            Stat.fieldGoalsMade.getAbv(),
            Stat.fieldGoalsAttempted.getAbv(),
            Stat.threePointersMade.getAbv(),
            Stat.threePointersAttempted.getAbv(),
            Stat.freeThrowsMade.getAbv(),
            Stat.freeThrowsAttempted.getAbv(),
            Stat.rebounds.getAbv(),
            Stat.assists.getAbv(),
            Stat.steals.getAbv(),
            Stat.blocks.getAbv(),
            Stat.turnovers.getAbv(),
            Stat.personalFouls.getAbv(),
            Stat.points.getAbv()
        ]
    }
}

// Updated PlayerData model to match Swagger documentation
struct PlayerData: Identifiable, Codable, Equatable, Hashable {
    var id: Int
    var gameDate: Date
    var opposingTeam: String // Changed from opponent to opposingTeam
    var points: Int
    var minutes: Int
    var fieldGoals: Int // Changed from fieldGoalsMade
    var threePointers: Int // Changed from threePointersMade
    var freeThrows: Int // Changed from freeThrowsMade
    var rebounds: Int
    var assists: Int
    var steals: Int
    var blocks: Int
    var turnovers: Int
    var fouls: Int // Changed from personalFouls
    var playerId: Int

    // Additional properties from your original model that aren't in Swagger
    // These will be computed properties
    var played: Bool {
        return minutes > 0
    }

    var fieldGoalsMade: Int {
        return fieldGoals
    }

    var fieldGoalsAttempted: Int {
        // This is not in the API but maintain compatibility
        return fieldGoals * 2 // Placeholder calculation
    }

    var threePointersMade: Int {
        return threePointers
    }

    var threePointersAttempted: Int {
        // This is not in the API but maintain compatibility
        return threePointers * 2 // Placeholder calculation
    }

    var freeThrowsMade: Int {
        return freeThrows
    }

    var freeThrowsAttempted: Int {
        // This is not in the API but maintain compatibility
        return freeThrows * 2 // Placeholder calculation
    }

    var personalFouls: Int {
        return fouls
    }

    func getNumberFromStat(_ stat: Stat) -> Int {
        switch stat {
        case .fieldGoalsMade:
            return fieldGoals
        case .fieldGoalsAttempted:
            return fieldGoalsAttempted
        case .threePointersMade:
            return threePointers
        case .threePointersAttempted:
            return threePointersAttempted
        case .freeThrowsMade:
            return freeThrows
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
            return fouls
        case .points:
            return points
        }
    }

    // Required for Hashable conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // Required for Equatable conformance
    static func == (lhs: PlayerData, rhs: PlayerData) -> Bool {
        return lhs.id == rhs.id
    }
}

// Updated dummy data to match the new structure
extension PlayerData {
    static let dummyData = [
        PlayerData(
            id: 0,
            gameDate: Date(),
            opposingTeam: "COLUMBIA",
            points: 40,
            minutes: 50,
            fieldGoals: 12,
            threePointers: 18,
            freeThrows: 2,
            rebounds: 4,
            assists: 5,
            steals: 50,
            blocks: 20,
            turnovers: 1,
            fouls: 50,
            playerId: 40
        ),
        PlayerData(
            id: 1,
            gameDate: Date().addingTimeInterval(-86400),
            opposingTeam: "HARVARD",
            points: 46,
            minutes: 50,
            fieldGoals: 25,
            threePointers: 22,
            freeThrows: 15,
            rebounds: 132,
            assists: 10,
            steals: 22,
            blocks: 58,
            turnovers: 40,
            fouls: 2,
            playerId: 55
        ),
        PlayerData(
            id: 2,
            gameDate: Date().addingTimeInterval(-172800),
            opposingTeam: "PRINCETON",
            points: 15,
            minutes: 0,
            fieldGoals: 0,
            threePointers: 0,
            freeThrows: 0,
            rebounds: 0,
            assists: 0,
            steals: 0,
            blocks: 0,
            turnovers: 0,
            fouls: 0,
            playerId: 0
        ),
        PlayerData(
            id: 3,
            gameDate: Date().addingTimeInterval(-172800 - 86400),
            opposingTeam: "PRINCETON",
            points: 10,
            minutes: 0,
            fieldGoals: 0,
            threePointers: 0,
            freeThrows: 0,
            rebounds: 0,
            assists: 0,
            steals: 0,
            blocks: 0,
            turnovers: 0,
            fouls: 0,
            playerId: 0
        ),
        PlayerData(
            id: 4,
            gameDate: Date().addingTimeInterval(-172800 - 172800),
            opposingTeam: "PRINCETON",
            points: 13,
            minutes: 0,
            fieldGoals: 0,
            threePointers: 0,
            freeThrows: 0,
            rebounds: 0,
            assists: 0,
            steals: 0,
            blocks: 0,
            turnovers: 0,
            fouls: 0,
            playerId: 0
        ),
        PlayerData(
            id: 5,
            gameDate: Date().addingTimeInterval(-172800 - 172800 - 86400),
            opposingTeam: "DARTMOUTH",
            points: 23,
            minutes: 0,
            fieldGoals: 0,
            threePointers: 0,
            freeThrows: 0,
            rebounds: 0,
            assists: 0,
            steals: 0,
            blocks: 0,
            turnovers: 0,
            fouls: 0,
            playerId: 0
        ),
        PlayerData(
            id: 6,
            gameDate: Date().addingTimeInterval(-172800 - 172800 - 172800),
            opposingTeam: "LEHIGH",
            points: 34,
            minutes: 0,
            fieldGoals: 0,
            threePointers: 0,
            freeThrows: 0,
            rebounds: 0,
            assists: 0,
            steals: 0,
            blocks: 0,
            turnovers: 0,
            fouls: 0,
            playerId: 0
        )
    ]
}
