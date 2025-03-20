//
//  BetTrackerViewModel.swift
//  All In
//
//  Created by jiwon jeong on 3/20/25.
//

import Foundation
import SwiftUI

extension BetTrackerView {

    /// The ViewModel for the Bet Tracker view.
    @MainActor
    class ViewModel: ObservableObject {

        // MARK: - Properties

        @Published var weeklyData: [DailyData] = []
        @Published var monthlyData: [DailyData] = []
        @Published var totalProfit: Int = 64
        @Published var ranking: Int = 52
        @Published var contractsSold: Int = 7
        @Published var accountAge: Int = 17

        struct DailyData {
            let day: String
            let value: Int
            let date: Date
        }

        init() {
            loadData()
        }

        // MARK: - Data Loading

        private func loadData() {
            weeklyData = [
                DailyData(day: "M", value: 2500, date: Date().addingTimeInterval(-6 * 86400)),
                DailyData(day: "T", value: -2000, date: Date().addingTimeInterval(-5 * 86400)),
                DailyData(day: "W", value: 1500, date: Date().addingTimeInterval(-4 * 86400)),
                DailyData(day: "TH", value: 3000, date: Date().addingTimeInterval(-3 * 86400)),
                DailyData(day: "F", value: -4000, date: Date().addingTimeInterval(-2 * 86400)),
                DailyData(day: "S", value: 2800, date: Date().addingTimeInterval(-1 * 86400)),
                DailyData(day: "SU", value: 3000, date: Date())
            ]

            monthlyData = weeklyData
        }

        // MARK: - Analytics Methods

        func calculateTotalGainsForCurrentWeek() -> Int {
            let currentWeekData = weeklyData
            return currentWeekData.reduce(0) { $0 + $1.value }
        }

        func calculateTotalGainsForLastWeek() -> Int {
            50
        }
    }
}
