//
//  UserModel.swift
//  All In
//
//  Created by Peter Bidoshi on 4/22/24.
//

struct User: Codable {

    let id: Int
    let username: String
    let email: String
    let balance: Double
    let contracts: [Contract]
    let sellerTransations: [Transaction]
    let buyerTransactions: [Transaction]

}

extension User {

    static let dummyData: [User] = [
        User(
            id: 0,
            username: "antoinztte",
            email: "act238@cornell.edu",
            balance: 1500.0,
            contracts: [
                Contract.dummyData[0],
                Contract.dummyData[1]
            ],
            sellerTransations: [],
            buyerTransactions: []
        ),
        User(
            id: 1,
            username: "antoinztte",
            email: "act238@cornell.edu",
            balance: 1000.0,
            contracts: [],
            sellerTransations: [],
            buyerTransactions: []
        )
    ]
}

