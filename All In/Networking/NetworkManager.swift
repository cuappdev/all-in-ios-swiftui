//
//  NetworkManager.swift
//  All In
//
//  Created by Peter Bidoshi on 4/21/24.
//

import Alamofire
import CryptoKit
import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    private let base = "LINK GOES HERE"

    private init() {
        
    }

    func createUser(username: String, email: String) {

        let parameters = [
            "username": username,
            "email": email
        ]

        AF.request("\(base)/users/", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: User.self) { response in

        }
    }

    func getUserImage(id: Int) {

    }
}

// USER - MOVE
struct User: Decodable {

    let id: Int
    let username: String
    let email: String
    let balance: Double
    let contracts: [Contract]
    let sellerTransations: [Transaction]
    let buyerTransactions: [Transaction]

}

struct Transaction: Decodable {

    let id: Int
    let transactionDate: Date
    let price: Int
    let sellerId: Int
    let buyerId: Int

}
