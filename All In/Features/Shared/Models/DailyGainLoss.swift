//
//  DailyGainLoss.swift
//  All In
//
//  Created by jiwon jeong on 3/20/25.
//

import Foundation

struct DailyGainLoss: Codable, Identifiable {
    let id: UUID
    let day: String
    let value: Int
    let date: Date

    init(id: UUID = UUID(), day: String, value: Int, date: Date) {
        self.id = id
        self.day = day
        self.value = value
        self.date = date
    }
}
