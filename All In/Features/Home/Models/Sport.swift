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

    static let basketball = Sport(name: "Basketball", icon: "basketball.fill")
    static let hockey = Sport(name: "Hockey", icon: "hockey.puck.fill")
    static let lacrosse = Sport(name: "Lacrosse", icon: "figure.lacrosse")
    static let football = Sport(name: "Football", icon: "football.fill")
    static let baseball = Sport(name: "Baseball", icon: "baseball.fill")
    static let soccer = Sport(name: "Soccer", icon: "soccerball")
    static let tennis = Sport(name: "Tennis", icon: "tennisball.fill")

    static let all: [Sport] = [
        basketball,
        hockey,
        lacrosse,
        football,
        baseball,
        soccer,
        tennis
    ]

    static func == (lhs: Sport, rhs: Sport) -> Bool {
        lhs.name == rhs.name
    }
}
