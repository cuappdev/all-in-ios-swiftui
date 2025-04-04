//
//  Sport.swift
//  All In
//
//  Created by jiwon jeong on 4/2/25.
//

import SwiftUI

struct Sport: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let icon: String

    static let all: [Sport] = [
        Sport(name: "Hockey", icon: "hockey.puck.fill"),
        Sport(name: "Basketball", icon: "basketball.fill"),
        Sport(name: "Lacrosse", icon: "figure.lacrosse"),
        Sport(name: "Football", icon: "football.fill"),
        Sport(name: "Baseball", icon: "baseball.fill"),
        Sport(name: "Soccer", icon: "soccerball"),
        Sport(name: "Tennis", icon: "tennisball.fill")
    ]

    static func == (lhs: Sport, rhs: Sport) -> Bool {
        lhs.name == rhs.name
    }
}
