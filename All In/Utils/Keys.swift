//
//  Keys.swift
//  All In
//
//  Created by Peter Bidoshi on 4/9/25.
//

import Foundation

struct Keys {

    static let serverURL = Keys.mainKeyDict(key: "ALL_IN_API_URL")

    private static func mainKeyDict(key: String) -> String {
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) else { return "" }
        return dict[key] as? String ?? ""
    }
}
