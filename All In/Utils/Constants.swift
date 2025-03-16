//
//  Constants.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/17/24.
//

import SwiftUI

struct Constants {

    enum Colors {
        // Greys
        static let greybg = Color(hex: 0xF0F1F2)
        static let grey00 = Color(hex: 0xF7F7F7)
        static let grey01 = Color(hex: 0xEFF1F4)
        static let grey02 = Color(hex: 0xDED9D9)
        static let grey03 = Color(hex: 0x606060)

        // Others
        static let black = Color(hex: 0x000000)
        static let white = Color(hex: 0xFFFFFF)
        static let red = Color(hex: 0xFF4F4F)
        static let brown = Color(hex: 0xCE9D9D)
        static let blue = Color(hex: 0x4387CB)
        static let green = Color(hex: 0x378C27)
        static let purple = Color(hex: 0x8643CB)
        static let yellow = Color(hex: 0xE9B140)

        static let gradientBlue = Color(hex: 0x1F70C7)
        static let gradientLightBlue = Color(hex: 0x7DF3FE)
        static let gradientPurple = Color(hex: 0x887DFE)
        static let gradientLavender = Color(hex: 0x7D97FE)
        static let blackBlue = Color(hex: 0x201E2D)
    }

    enum Fonts {
        static let title = Font.system(size: 36, weight: .bold, design: .default)
        static let faq = Font.system(size: 32, weight: .bold, design: .default)
        static let faq2 = Font.system(size: 15, weight: .regular, design: .default)
        static let header = Font.system(size: 24, weight: .bold, design: .default)
        static let subheader = Font.system(size: 18, weight: .bold, design: .default)
        static let bodyBold = Font.system(size: 16, weight: .semibold, design: .default)
        static let body = Font.system(size: 16, weight: .regular, design: .default)
        static let caption = Font.system(size: 12, weight: .regular, design: .default)
    }

    struct UserDefaultKeys {
        static let userID = "UserID"
    }

}
