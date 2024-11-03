//
//  TabBar.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/17/24.
//

import Foundation
import SwiftUI

struct TabBar: View {

    @Binding var selectedPage: TabBarPage
    let tabItemSize: CGFloat = 24

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.6), radius: 10, x: 0, y: 10)

            HStack {
                VStack {
                    Image("Home")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: tabItemSize, height: tabItemSize)
                        .foregroundStyle(selectedPage == .home ? Constants.Colors.red: Constants.Colors.grey03)

                    Text("Home")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(selectedPage == .home ? Constants.Colors.red: Constants.Colors.grey03)

                }

                Spacer()

                VStack {
                    Image("Market")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: tabItemSize, height: tabItemSize)
                        .foregroundStyle(selectedPage == .market ? Constants.Colors.red: Constants.Colors.grey03)

                    Text("Marketplace")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(selectedPage == .market ? Constants.Colors.red: Constants.Colors.grey03)
                }

                Spacer()

                VStack {
                    Image("Person")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: tabItemSize, height: tabItemSize)
                        .foregroundStyle(selectedPage == .profile ? Constants.Colors.red: Constants.Colors.grey03)

                    Text("Profile")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(selectedPage == .profile ? Constants.Colors.red: Constants.Colors.grey03)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 58, bottom: 10, trailing: 58))
        }
    }
}

enum TabBarPage: Int {
    case home = 0
    case market = 1
    case profile = 2
}

#Preview {
    TabBar(selectedPage: .constant(.home))
}
