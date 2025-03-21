//
//  TransactionModel.swift
//  All In
//
//  Created by Peter Bidoshi on 4/22/24.
//

import Foundation

struct Transaction: Codable {

    let id: Int
    let transactionDate: Date
    let price: Int
    let sellerId: Int
    let buyerId: Int
    let contractId: Int

}
