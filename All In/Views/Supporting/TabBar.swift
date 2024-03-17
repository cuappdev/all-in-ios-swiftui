//
//  TabBar.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/17/24.
//

import Foundation
import SwiftUI

struct TabBar: View {

    let page: String
    let tabItemSize: CGFloat = 38

    var body: some View {
        ZStack {
            Constants.Colors.grey01
            HStack {
                Image("Home")
                    .resizable()
                    .frame(width: tabItemSize, height: tabItemSize)
                    .foregroundStyle(page == "home" ? Constants.Colors.red: Constants.Colors.grey02)
                Spacer()
                Image("Market")
                    .resizable()
                    .frame(width: tabItemSize, height: tabItemSize)
                    .foregroundStyle(page == "market" ? Constants.Colors.red: Constants.Colors.grey02)
                Spacer()
                Image("Profile")
                    .resizable()
                    .frame(width: tabItemSize * 0.90, height: tabItemSize)
                    .foregroundStyle(page == "profile" ? Constants.Colors.red: Constants.Colors.grey02)
            }
            .padding(EdgeInsets(top: 0, leading: 58, bottom: 0, trailing: 58))
        }
    }
}

#Preview {
    TabBar(page: "home")
}

