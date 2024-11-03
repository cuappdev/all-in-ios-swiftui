//
//  ContentView.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/3/24.
//

import SwiftUI

struct ContentView: View {

    @State var selectedPage: TabBarPage = .home

    var body: some View {
        ZStack {
            TabView(selection: $selectedPage) {
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

                ProfileView(user: User.dummyData[0])
                    .tag(TabBarPage.profile)
                    .tabItem {
                        EmptyView()
                    }
            }

            VStack {
                Spacer()

                TabBar(selectedPage: $selectedPage)
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
