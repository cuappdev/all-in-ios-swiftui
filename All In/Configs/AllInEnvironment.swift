//
//  AllInEnvironment.swift
//  All In
//
//  Created by Jayson Hahn on 10/27/24.
//

import Foundation

enum AllInEnvironment {

    /// Keys from Info.plist.
    enum Keys {
        static let baseURL: String = "ALLIN_PROD_URL"
    }

    /// A dictionary storing key-value pairs from Info.plist.
    private static let infoDict: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Info.plist not found")
        }
        return dict
    }()

    /**
     The base URL of All In's backend server.
     */
    static let baseURL: URL = {
        guard let baseURLString = AllInEnvironment.infoDict[Keys.baseURL] as? String,
              let baseURL = URL(string: baseURLString) else {
            fatalError("ALLIN_PROD_URL not found in Info.plist")
        }
        return baseURL
    }()

}
