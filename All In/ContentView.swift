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
            VStack(spacing: 0) {
                Group {
                    if tabNavigationManager.selectedTab == .home {
                        HomeView(user: user)
                            .transition(transitionModifier)
                    } else if tabNavigationManager.selectedTab == .market {
                        MarketplaceView()
                            .transition(transitionModifier)
                    } else if tabNavigationManager.selectedTab == .betTracker {
                        BetTrackerView(user: user)
                            .transition(transitionModifier)
                    }
                }

                if !tabNavigationManager.hideTabBar {
                    TabBar(selectedPage: $tabNavigationManager.selectedTab)
                        .frame(height: 96)
                        .transition(.opacity)
                }
            }
        } else {
            Constants.Colors.background
                .ignoresSafeArea()
                .onAppear {
                    guard googleAuthManager.user == nil, !googleAuthManager.isSigningIn else { return }

                    Task {
                        do {
                            try await googleAuthManager.refreshSignInIfNeeded()
                        } catch {
                            googleAuthManager.logger.info("Failed to find google sign in session: \(error)")
                            do {
                                try await googleAuthManager.signIn()
                            } catch {
                                googleAuthManager.logger.error("Failed to sign in: \(error)")
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
