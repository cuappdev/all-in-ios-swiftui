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

    private let pages: [TabBarPage] = [.home, .market, .betTracker]
    private let tabItemSize: CGFloat = 24
    private let unselectedColor = Constants.Colors.white
    private let selectedColor = Constants.Colors.gradientLightBlue

    var body: some View {
        VStack {
            HStack {
                ForEach(pages, id: \.id) { page in
                    tabButton(page: page) {
                        VStack {
                            Image(page.image)
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: tabItemSize, height: tabItemSize)
                                .foregroundStyle(selectedPage == page ? selectedColor: unselectedColor)

                            Text(page.name)
                                .font(.system(size: 12, weight: .regular))
                                .foregroundStyle(selectedPage == page ? selectedColor: unselectedColor)
                        }
                    }

                    if page.id != pages.last?.id {
                        Spacer()
                    }
                }
            }

            Spacer()
        }.padding()
    }

    func tabButton(page: TabBarPage, content: () -> some View) -> some View {
        Button {
            selectedPage = page
        } label: {
            content()
        }
        .frame(width: 96, height: 48)
    }
}

class TabNavigationManager: ObservableObject {
    @Published var selectedTab: TabBarPage = .home
}

struct TabBarPage: Equatable {

    let id: Int
    let name: String
    let image: String

    static let home = TabBarPage(id: 0, name: "Home", image: "home")
    static let market = TabBarPage(id: 1, name: "Marketplace", image: "marketplace")
    static let betTracker = TabBarPage(id: 2, name: "Bet Tracker", image: "bet-tracker")

}

#Preview {
    TabBar(selectedPage: .constant(.home))
}
