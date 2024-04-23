//
//  NSNumberFormatter.swift
//  All In
//
//  Created by Daniel Chuang on 4/23/24.
//

import Foundation

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
