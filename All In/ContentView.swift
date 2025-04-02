//
//  ContentView.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/3/24.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var tabNavigationManager: TabNavigationManager

    private let transitionModifier = AnyTransition.opacity.animation(.easeInOut(duration: 0.15))

    var body: some View {
        VStack {
            Group {
                if tabNavigationManager.selectedTab == .home {
                    MainProfileView(user: User.dummyData[0])
                        .transition(transitionModifier)
                } else if tabNavigationManager.selectedTab == .market {
                    MarketplaceView()
                        .transition(transitionModifier)
                } else if tabNavigationManager.selectedTab == .betTracker {
                    BetTrackerView(user: User.dummyData[0])
                        .transition(transitionModifier)
                }
            }

            TabBar(selectedPage: $tabNavigationManager.selectedTab)
                .frame(height: 96)
        }
        .ignoresSafeArea()
        .background(Constants.Colors.background)
    }

}

#Preview {
    ContentView()
}
