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

    for i in 1...12 {
        let date = Calendar.current.date(byAdding: .day, value: -(12-i), to: Date())!
        let value = Int.random(in: -800...1200)
        result.append(DailyGainLoss(
            day: "\(i)",
            value: value,
            date: date
        ))
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
            id: 10,
            username: "monicajlee",
            email: "ml123@cornell.edu",
            balance: 5000,
            contracts: [],
            sellerTransactions: [],
            buyerTransactions: [],
            createdAt: Calendar.current.date(byAdding: .day, value: -45, to: Date())!,
            totalProfit: 150,
            ranking: 1,
            weeklyGainLoss: [
                DailyGainLoss(
                    day: "M",
                    value: 2000,
                    date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!
                ),
                DailyGainLoss(
                    day: "T",
                    value: 1500,
                    date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!
                ),
                DailyGainLoss(
                    day: "W",
                    value: 3200,
                    date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!
                ),
                DailyGainLoss(
                    day: "TH",
                    value: 2100,
                    date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!
                ),
                DailyGainLoss(
                    day: "F",
                    value: 3500,
                    date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!
                ),
                DailyGainLoss(
                    day: "S",
                    value: 1800,
                    date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!
                ),
                DailyGainLoss(
                    day: "SU",
                    value: 2200,
                    date: Date()
                )
            ],
            monthlyGainLoss: generateMonthlyGainLoss()
        ),
        User(
            id: 11,
            username: "audreywuu",
            email: "aw123@cornell.edu",
            balance: 4000,
            contracts: [],
            sellerTransactions: [],
            buyerTransactions: [],
            createdAt: Calendar.current.date(byAdding: .day, value: -38, to: Date())!,
            totalProfit: 120,
            ranking: 2,
            weeklyGainLoss: [
                DailyGainLoss(
                    day: "M",
                    value: 1800,
                    date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!
                ),
                DailyGainLoss(
                    day: "T",
                    value: 2200,
                    date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!
                ),
                DailyGainLoss(
                    day: "W",
                    value: 900,
                    date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!
                ),
                DailyGainLoss(
                    day: "TH",
                    value: 1500,
                    date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!
                ),
                DailyGainLoss(
                    day: "F",
                    value: 2800,
                    date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!
                ),
                DailyGainLoss(
                    day: "S",
                    value: 1600,
                    date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!
                ),
                DailyGainLoss(
                    day: "SU",
                    value: 2000,
                    date: Date()
                )
            ],
            monthlyGainLoss: generateMonthlyGainLoss()
        ),
        User(
            id: 12,
            username: "laurenjun",
            email: "lj123@cornell.edu",
            balance: 3000,
            contracts: [],
            sellerTransactions: [],
            buyerTransactions: [],
            createdAt: Calendar.current.date(byAdding: .day, value: -32, to: Date())!,
            totalProfit: 100,
            ranking: 3,
            weeklyGainLoss: [
                DailyGainLoss(
                    day: "M",
                    value: 1200,
                    date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!
                ),
                DailyGainLoss(
                    day: "T",
                    value: 1800,
                    date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!
                ),
                DailyGainLoss(
                    day: "W",
                    value: 1500,
                    date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!
                ),
                DailyGainLoss(
                    day: "TH",
                    value: 900,
                    date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!
                ),
                DailyGainLoss(
                    day: "F",
                    value: 2200,
                    date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!
                ),
                DailyGainLoss(
                    day: "S",
                    value: 1400,
                    date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!
                ),
                DailyGainLoss(
                    day: "SU",
                    value: 1600,
                    date: Date()
                )
            ],
            monthlyGainLoss: generateMonthlyGainLoss()
        ),
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
            ranking: 4,
            weeklyGainLoss: [
                DailyGainLoss(
                    day: "M",
                    value: 1000,
                    date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!
                ),
                DailyGainLoss(
                    day: "T",
                    value: -2000,
                    date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!
                ),
                DailyGainLoss(
                    day: "W",
                    value: 3000,
                    date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!
                ),
                DailyGainLoss(
                    day: "TH",
                    value: -1500,
                    date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!
                ),
                DailyGainLoss(
                    day: "F",
                    value: 2500,
                    date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!
                ),
                DailyGainLoss(
                    day: "S",
                    value: 1200,
                    date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!
                ),
                DailyGainLoss(
                    day: "SU",
                    value: -800,
                    date: Date()
                )
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
            ranking: 5,
            weeklyGainLoss: [
                DailyGainLoss(
                    day: "M",
                    value: 500,
                    date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!
                ),
                DailyGainLoss(
                    day: "T",
                    value: 4000,
                    date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!
                ),
                DailyGainLoss(
                    day: "W",
                    value: -2500,
                    date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!
                ),
                DailyGainLoss(
                    day: "TH",
                    value: 200,
                    date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!
                ),
                DailyGainLoss(
                    day: "F",
                    value: -1200,
                    date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!
                ),
                DailyGainLoss(
                    day: "S",
                    value: 600,
                    date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!
                ),
                DailyGainLoss(
                    day: "SU",
                    value: 2000,
                    date: Date()
                )
            ],
            monthlyGainLoss: generateMonthlyGainLoss()
        ),
        User(
            id: 2,
            username: "charlesliggins",
            email: "cl123@cornell.edu",
            balance: 1200,
            contracts: [],
            sellerTransactions: [],
            buyerTransactions: [],
            createdAt: Calendar.current.date(byAdding: .day, value: -25, to: Date())!,
            totalProfit: 42,
            ranking: 6,
            weeklyGainLoss: [
                DailyGainLoss(
                    day: "M",
                    value: 800,
                    date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!
                ),
                DailyGainLoss(
                    day: "T",
                    value: 1200,
                    date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!
                ),
                DailyGainLoss(
                    day: "W",
                    value: -500,
                    date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!
                ),
                DailyGainLoss(
                    day: "TH",
                    value: 350,
                    date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!
                ),
                DailyGainLoss(
                    day: "F",
                    value: 1000,
                    date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!
                ),
                DailyGainLoss(
                    day: "S",
                    value: -200,
                    date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!
                ),
                DailyGainLoss(
                    day: "SU",
                    value: 400,
                    date: Date()
                )
            ],
            monthlyGainLoss: generateMonthlyGainLoss()
        ),
        User(
            id: 3,
            username: "jiwonjeong",
            email: "jj456@cornell.edu",
            balance: 2000,
            contracts: [],
            sellerTransactions: [],
            buyerTransactions: [],
            createdAt: Calendar.current.date(byAdding: .day, value: -40, to: Date())!,
            totalProfit: 98,
            ranking: 7,
            weeklyGainLoss: [
                DailyGainLoss(
                    day: "M",
                    value: 1500,
                    date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!
                ),
                DailyGainLoss(
                    day: "T",
                    value: -800,
                    date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!
                ),
                DailyGainLoss(
                    day: "W",
                    value: 2200,
                    date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!
                ),
                DailyGainLoss(
                    day: "TH",
                    value: 1800,
                    date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!
                ),
                DailyGainLoss(
                    day: "F",
                    value: -500,
                    date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!
                ),
                DailyGainLoss(
                    day: "S",
                    value: 900,
                    date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!
                ),
                DailyGainLoss(
                    day: "SU",
                    value: 1300,
                    date: Date()
                )
            ],
            monthlyGainLoss: generateMonthlyGainLoss()
        ),
        User(
            id: 4,
            username: "adelynnwu",
            email: "aw789@cornell.edu",
            balance: 1800,
            contracts: [],
            sellerTransactions: [],
            buyerTransactions: [],
            createdAt: Calendar.current.date(byAdding: .day, value: -35, to: Date())!,
            totalProfit: 76,
            ranking: 8,
            weeklyGainLoss: [
                DailyGainLoss(
                    day: "M",
                    value: 700,
                    date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!
                ),
                DailyGainLoss(
                    day: "T",
                    value: 1600,
                    date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!
                ),
                DailyGainLoss(
                    day: "W",
                    value: -300,
                    date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!
                ),
                DailyGainLoss(
                    day: "TH",
                    value: 2100,
                    date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!
                ),
                DailyGainLoss(
                    day: "F",
                    value: -700,
                    date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!
                ),
                DailyGainLoss(
                    day: "S",
                    value: 1100,
                    date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!
                ),
                DailyGainLoss(
                    day: "SU",
                    value: 950,
                    date: Date()
                )
            ],
            monthlyGainLoss: generateMonthlyGainLoss()
        )
    ]
}
