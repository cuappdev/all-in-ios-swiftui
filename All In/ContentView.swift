//
//  ContentView.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/3/24.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var tabNavigationManager: TabNavigationManager
    @EnvironmentObject var googleAuthManager: GoogleAuthManager

    private let transitionModifier = AnyTransition.opacity.animation(.easeInOut(duration: 0.15))

    var body: some View {
        if let user = googleAuthManager.user {
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
            .ignoresSafeArea(.container, edges: .top)
            .background(Constants.Colors.background)
        } else {
            Constants.Colors.background
                .ignoresSafeArea()
                .onAppear {
                    Task {
                        if !googleAuthManager.isSigningIn {
                            do {
                                try await GoogleAuthManager.shared.refreshSignInIfNeeded()
                            } catch {
                                GoogleAuthManager.shared.logger.info("Failed to find a session, trying Google Login; Error: \(error)")
                                do {
                                    try await GoogleAuthManager.shared.signIn()
                                } catch {
                                    GoogleAuthManager.shared.logger.error("Failed to sign in; Error: \(error)")
                                }
                            }
                        }
                    }
                }

        }
    }

}

extension View {
    // Gradient function used for "contracts ending today" card backgrounds
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(
            LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
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
