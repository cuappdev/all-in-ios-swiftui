//
//  UserModel.swift
//  All In
//
//  Created by Peter Bidoshi on 4/22/24.
//

import Foundation

// Helper function to generate monthly gain loss data
private func generateMonthlyGainLoss() -> [DailyGainLoss] {
    var result: [DailyGainLoss] = []

    for i in 1...30 {
        let date = Calendar.current.date(byAdding: .day, value: -(30-i), to: Date())!
        let value = Int.random(in: -800...1200)
        result.append(DailyGainLoss(day: "\(i)", value: value, date: date))
    }

    return result
}

struct User: Codable, Identifiable {
    let id: Int
    let username: String
    let email: String
    let balance: Int
    let contracts: [Contract]
    let sellerTransactions: [Transaction]
    let buyerTransactions: [Transaction]
    let createdAt: Date
    let totalProfit: Int
    let ranking: Int
    let weeklyGainLoss: [DailyGainLoss]
    let monthlyGainLoss: [DailyGainLoss]
}

extension User {
    static let dummyData: [User] = [
        User(
            id: 0,
            username: "antoinztte",
            email: "act238@cornell.edu",
            balance: 1000,
            contracts: [
                Contract.dummyData[0],
                Contract.dummyData[1]
            ],
            sellerTransactions: [],
            buyerTransactions: [],
            createdAt: Calendar.current.date(byAdding: .day, value: -17, to: Date())!,
            totalProfit: 64,
            ranking: 52,
            weeklyGainLoss: [
                DailyGainLoss(day: "M", value: 1000, date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!),
                DailyGainLoss(day: "T", value: -2000, date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!),
                DailyGainLoss(day: "W", value: 3000, date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!),
                DailyGainLoss(day: "TH", value: -1500, date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!),
                DailyGainLoss(day: "F", value: 2500, date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!),
                DailyGainLoss(day: "S", value: 1200, date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!),
                DailyGainLoss(day: "SU", value: -800, date: Date())
            ],
            monthlyGainLoss: generateMonthlyGainLoss()
        ),
        User(
            id: 1,
            username: "peterbidoshi",
            email: "pb384@cornell.edu",
            balance: 1500,
            contracts: [],
            sellerTransactions: [],
            buyerTransactions: [],
            createdAt: Calendar.current.date(byAdding: .day, value: -30, to: Date())!,
            totalProfit: 25,
            ranking: 87,
            weeklyGainLoss: [
                DailyGainLoss(day: "M", value: 500, date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!),
                DailyGainLoss(day: "T", value: 4000, date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!),
                DailyGainLoss(day: "W", value: -2500, date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!),
                DailyGainLoss(day: "TH", value: 200, date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!),
                DailyGainLoss(day: "F", value: -1200, date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!),
                DailyGainLoss(day: "S", value: 600, date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!),
                DailyGainLoss(day: "SU", value: 2000, date: Date())
            ],
            monthlyGainLoss: generateMonthlyGainLoss()
        )
    ]
}
