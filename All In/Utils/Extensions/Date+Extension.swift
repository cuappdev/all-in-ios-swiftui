//
//  Date+Extension.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

extension Date {
    var monthDayFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter.string(from: self)
    }
}
