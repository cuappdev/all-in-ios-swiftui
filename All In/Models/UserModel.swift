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
