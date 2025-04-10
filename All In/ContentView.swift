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
        VStack(spacing: 0) {
            Group {
                if tabNavigationManager.selectedTab == .home {
                    HomeView(user: User.dummyData[0])
                        .transition(transitionModifier)
                } else if tabNavigationManager.selectedTab == .market {
                    MarketplaceView()
                        .transition(transitionModifier)
                } else if tabNavigationManager.selectedTab == .betTracker {
                    BetTrackerView(user: User.dummyData[0])
                        .transition(transitionModifier)
                }
            }

            if !tabNavigationManager.hideTabBar {
                TabBar(selectedPage: $tabNavigationManager.selectedTab)
                    .frame(height: 96)
                    .transition(.opacity)
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        .background(Constants.Colors.background)
    }

}

#Preview {
    ContentView()
        .environmentObject(TabNavigationManager())
        .environmentObject(ProfileViewViewModel())
//        .environmentObject(MarketplaceViewModel())
}
