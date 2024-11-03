//
//  Color+Extension.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

// https://stackoverflow.com/questions/71744888/swiftui-view-with-rounded-corners-and-border
extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
