//
//  ContentView.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/3/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ZStack {
            TabView {
                HomeView()
                    .tabItem {
                        EmptyView()
                    }

                MarketplaceView()
                    .tabItem {
                        EmptyView()
                    }

                ProfileView(user: User.dummyData[0])
                    .tabItem {
                        EmptyView()
                    }
            }
            .onAppear {
                UITabBar.appearance().unselectedItemTintColor = .white

            }
        }
    }

}

#Preview {
    ContentView()
}
