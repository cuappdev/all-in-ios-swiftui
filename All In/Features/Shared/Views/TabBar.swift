//
//  TabBar.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/17/24.
//

import SwiftUI

struct TabBar: View {
    let page: String
    let tabItemSize: CGFloat = 24

    var body: some View {
        ZStack {
            Constants.Colors.background
                .ignoresSafeArea(edges: .bottom)
            HStack {
                VStack {
                    Image("home")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: tabItemSize, height: tabItemSize)
                        .foregroundStyle(page == "home" ? Constants.Colors.red : Constants.Colors.white)
                    Text("Home")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(page == "home" ? Constants.Colors.red : Constants.Colors.white)
                }
                Spacer()
                VStack {
                    Image("marketplace")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: tabItemSize, height: tabItemSize)
                        .foregroundStyle(page == "market" ? Constants.Colors.red : Constants.Colors.white)
                    Text("Marketplace")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(page == "market" ? Constants.Colors.red : Constants.Colors.white)
                }
                Spacer()
                VStack {
                    Image("bet-tracker")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: tabItemSize, height: tabItemSize)
                        .foregroundStyle(page == "profile" ? Constants.Colors.red : Constants.Colors.white)
                    Text("Bet Tracker")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(page == "profile" ? Constants.Colors.red : Constants.Colors.white)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 32, bottom: 24, trailing: 32))
        }
        .toolbarBackground(Constants.Colors.background, for: .tabBar)
    }
}

#Preview {
    TabBar(page: "market")
}
