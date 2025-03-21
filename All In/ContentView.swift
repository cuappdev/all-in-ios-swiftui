//
//  ContentView.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/3/24.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var tabNavigationManager: TabNavigationManager

    var body: some View {
        ZStack {
            TabView(selection: $tabNavigationManager.selectedTab) {
                HomeView()
                    .tag(TabBarPage.home)
                    .tabItem {
                        EmptyView()
                    }

                MarketplaceView()
                    .tag(TabBarPage.market)
                    .tabItem {
                        EmptyView()
                    }

                BetTrackerView(user: User.dummyData[0])
                    .tag(TabBarPage.profile)
                    .tabItem {
                        EmptyView()
                    }
            }

            VStack {
                Spacer()

                TabBar(selectedPage: $tabNavigationManager.selectedTab)
                    .frame(height: 82)
            }
            .ignoresSafeArea()
            .allowsHitTesting(false)
        }
    }

}

#Preview {
    ContentView()
}
