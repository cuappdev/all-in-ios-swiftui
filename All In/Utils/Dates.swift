//
//  Dates.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd" // Customize the date format
    return formatter
}()
