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
        static let lightBlue = Color(hex: 0x99C5F4)
        static let blue = Color(hex: 0x4387CB)
        static let green = Color(hex: 0x378C27)
        static let purple = Color(hex: 0x8643CB)
        static let yellow = Color(hex: 0xE9B140)
        static let orange = Color(hex: 0xF97066)
        static let lightGreen = Color(hex: 0x47CD89)
        static let gradientBlue = Color(hex: 0x1F70C7)
        static let gradientLightBlue = Color(hex: 0x7DF3FE)
        static let gradientPurple = Color(hex: 0x887DFE)
        static let gradientLavender = Color(hex: 0x7D97FE)
        static let blackBlue = Color(hex: 0x201E2D)
        static let backgroundBlack = Color(hex: 0x15141B)

        // Charts
        static let greenChart = Color(hex: 0x47CD89)
        static let redChart = Color(hex: 0xF97066)
        static let moneyGreen = Color(hex: 0x47CD89)

        // System
        static let background = Color(hex: 0x15141B)

        // Gradient
        static let gradient = Gradient(
            colors: [
                Constants.Colors.gradientBlue,
                Constants.Colors.gradientLightBlue,
                Constants.Colors.gradientPurple,
                Constants.Colors.gradientLavender
            ]
        )

    }

    enum Fonts {
        static let title = Font.system(size: 36, weight: .bold, design: .default)
        static let faq = Font.system(size: 32, weight: .bold, design: .default)
        static let faq2 = Font.system(size: 15, weight: .regular, design: .default)
        static let header = Font.system(size: 24, weight: .bold, design: .default)
        static let subheader = Font.system(size: 18, weight: .bold, design: .default)
        static let bodyBold = Font.system(size: 16, weight: .semibold, design: .default)
        static let body = Font.system(size: 16, weight: .regular, design: .default)
        static let pillButton = Font.system(size: 12, weight: .semibold, design: .default)

        // Profile
        static let headerProfile = Font.custom("LexendDeca-SemiBold", size: 24)
        static let subheaderProfile = Font.custom("LexendDeca-SemiBold", size: 18)
        static let cardHeader = Font.custom("LexendDeca-SemiBold", size: 12)
        static let cardContent = Font.custom("LexendDeca-Medium", size: 22)
        static let profileCard = Font.custom("LexendDeca-SemiBold", size: 20)
        static let caption = Font.custom("LexendDeca-Medium", size: 12)
        static let subFAQ = Font.custom("LexendDeca-Light", size: 15)
        static let faqDetail = Font.custom("LexendDeca-Medium", size: 16)
        static let faqDetail2 = Font.custom("LexendDeca-Light", size: 14)
        static let marketPlaceTitle = Font.custom("LexendDeca-SemiBold", size: 15)

        // Main
        static let mainHeader = Font.custom("LexendDeca-Medium", size: 16)
        static let mainPack = Font.custom("LexendDeca-Medium", size: 12)
        static let pillButtonMain = Font.custom("LexendDeca-Light", size: 14)
    }

    struct UserDefaultKeys {
        static let userID = "UserID"
    }

}
