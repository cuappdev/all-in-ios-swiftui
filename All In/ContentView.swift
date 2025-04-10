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
        .ignoresSafeArea()
        .background(Constants.Colors.background)
    }

}

extension View {
    // Gradient function used for "contracts ending today" card backgrounds
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(
            LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
        )
            .mask(self)
    }
}

#Preview {
    ContentView()
        .environmentObject(TabNavigationManager())
        .environmentObject(ProfileViewViewModel())
//        .environmentObject(MarketplaceViewModel())
}
