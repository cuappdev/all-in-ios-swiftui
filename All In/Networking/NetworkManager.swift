//
//  NetworkManager.swift
//  All In
//
//  Created by Peter Bidoshi on 4/21/24.
//

import Alamofire
import AlamofireImage
import CryptoKit
import SwiftUI

class NetworkManager {
    static let shared = NetworkManager()

    private let base = "LINK GOES HERE"

    private init() { }

    // MARK: - POST create user

    func createUser(username: String, email: String) {
        let parameters = [
            "username": username,
            "email": email
        ]

        AF.request("\(base)/users/", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let user):
                UserDefaults.standard.setValue(user.id, forKey: UserDefaultKeys.userID)
            case .failure(let error):
                print("ERROR in NetworkManager.createUser: \(error)")
            }
        }
    }

    // MARK: - GET user

    func getUser(id: Int, completion: @escaping (User) -> Void) {
        AF.request("\(base)/users/\(id)", method: .get).responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let user):
                completion(user)
            case .failure(let error):
                print("ERROR in NetworkManager.getUser: \(error)")
            }
        }
    }

    // MARK: - PATCH upload user image

    func uploadUserImage(image: UIImage, completion: @escaping (UIImage) -> Void) {
        let id = UserDefaults.standard.integer(forKey: UserDefaultKeys.userID)

        AF.upload(multipartFormData: { multipartFormData in
            if let data = image.jpegData(compressionQuality: 0.5) {
                multipartFormData.append(data, withName: "image")
            }
        }, to: "\(base)/users/\(id)/image").responseImage { response in
            switch response.result {
            case .success(let image):
                completion(image)
            case .failure(let error):
                print("ERROR in NetworkManager.uploadUserImage: \(error)")
            }
        }
    }

    // MARK: - GET user image

    func getUserImage(completion: @escaping (UIImage) -> Void) {
        let id = UserDefaults.standard.integer(forKey: UserDefaultKeys.userID)
        
        AF.request("\(base)/users/\(id)", method: .get).responseImage { response in
            switch response.result {
            case .success(let image):
                completion(image)
            case .failure(let error):
                print("ERROR in NetworkManager.getUserImage: \(error)")
            }
        }
    }

    // MARK: - GET player

    func getPlayer(id: Int, completion: @escaping (Player) -> Void) {
        AF.request("\(base)/players/\(id)", method: .get).responseDecodable(of: Player.self) { response in
            switch response.result {
            case .success(let player):
                completion(player)
            case .failure(let error):
                print("ERROR in NetworkManager.getPlayer: \(error)")
            }
        }
    }

    // MARK: - POST buy rarity contract from chest

    func getRarity(buyPrice: Double, rarity: Rarity, completion: @escaping (Contract) -> Void) {
        let id = UserDefaults.standard.integer(forKey: UserDefaultKeys.userID)
        
        let parameters = [
            "buy_price": buyPrice,
            "rarity": rarity.rawValue
        ] as [String : Any]


        AF.request("\(base)/users/\(id)/contracts", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: Contract.self) { response in
            switch response.result {
            case .success(let contract):
                completion(contract)
            case .failure(let error):
                print("ERROR in NetworkManager.getRarityChest: \(error)")
            }
        }
    }

    // MARK: - POST buy player contract from chest

    func getPlayerContract(buyPrice: Double, playerID: Int, completion: @escaping (Contract) -> Void) {
        let id = UserDefaults.standard.integer(forKey: UserDefaultKeys.userID)

        let parameters = [
            "buy_price": buyPrice,
        ]

        AF.request("\(base)/users/\(id)/players/\(playerID)/contracts", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: Contract.self) { response in
            switch response.result {
            case .success(let contract):
                completion(contract)
            case .failure(let error):
                print("ERROR in NetworkManager.getRarityChest: \(error)")
            }
        }
    }

    // MARK: - GET all contracts on market

    func getContracts(completion: @escaping ([Contract]) -> Void) {
        AF.request("\(base)/contracts", method: .get).responseDecodable(of: [Contract].self) { response in
            switch response.result {
            case .success(let contracts):
                completion(contracts)
            case .failure(let error):
                print("ERROR in NetworkManager.getContracts: \(error)")
            }
        }
    }

    // MARK: - POST buy a contract

    func buyContract(contractID: Int, completion: @escaping (Contract) -> Void) {
        let id = UserDefaults.standard.integer(forKey: UserDefaultKeys.userID)

        let parameters = [
            "buyer_id": id
        ]

        AF.request("\(base)/contracts/\(contractID)/buy", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: Contract.self) { response in
            switch response.result {
            case .success(let contract):
                completion(contract)
            case .failure(let error):
                print("ERROR in NetworkManager.buyContract: \(error)")
            }
        }
    }

    // MARK: - POST sell a contract

    func sellContract(contractID: Int, sellPrice: Double, completion: @escaping (Contract) -> Void) {
        let parameters = [
            "sell_price": sellPrice
        ]

        AF.request("\(base)/contracts/\(contractID)/sell", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: Contract.self) { response in
            switch response.result {
            case .success(let contract):
                completion(contract)
            case .failure(let error):
                print("ERROR in NetworkManager.sellContract: \(error)")
            }
        }
    }

    // MARK: - GET all contract a user owns


}
