//
//  ContentView.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/3/24.
//

import SwiftUI

struct ContentView: View {

    @State var tabSelection = 0

    var body: some View {
        ZStack {
            TabView(selection: $tabSelection) {
                HomeView(tabSelection: $tabSelection)
                    .tag(0)
                    .tabItem {
                        EmptyView()
                    }

                MarketplaceView(tabSelection: $tabSelection)
                    .tag(1)
                    .tabItem {
                        EmptyView()
                    }

                ProfileView(tabSelection: $tabSelection)
                    .tag(2)
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
