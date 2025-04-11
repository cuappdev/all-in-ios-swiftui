//
//  PlayerSeeAllScreen.swift
//  All In
//
//  Created by jiwon jeong on 4/3/25.
//

import SwiftUI

struct PlayerSeeAllScreen: View {

    // MARK: - Properties

    @Environment(\.dismiss) private var dismiss
    var players: [Player]
    var selectedSport: Sport
    @EnvironmentObject var tabNavigationManager: TabNavigationManager

    // States for continuous scrolling animation
    @State private var rightScrollOffset: CGFloat = 0
    @State private var leftScrollOffset: CGFloat = 0

    // Timer for automatic scrolling
    @State private var scrollTimer: Timer?

    private func startScrollAnimation() {
        // Calculate the total width of one set of players
        let playerWidth: CGFloat = 100 + 16 // Card width + spacing
        let totalWidth = CGFloat(Player.dummyData.count) * playerWidth

        // Initialize offsets
        rightScrollOffset = 0
        leftScrollOffset = -totalWidth

        // Create a timer for continuous scrolling
        scrollTimer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            // Update scroll offsets
            withAnimation {
                // Right-moving row (first row)
                rightScrollOffset -= 1
                if rightScrollOffset < -totalWidth {
                    rightScrollOffset = 0
                }

                // Left-moving row (second row)
                leftScrollOffset += 1
                if leftScrollOffset > 0 {
                    leftScrollOffset = -totalWidth
                }
            }
        }
    }

    // MARK: - UI

    var body: some View {
        NavigationStack {
            VStack(spacing: 2) {
                VStack(spacing: 10) {
                    headerView

                    Text("Player Pack")
                        .font(Constants.Fonts.headerProfile)
                        .foregroundStyle(Constants.Colors.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(selectedSport.name)
                        .font(Constants.Fonts.packSubtitle)
                        .foregroundStyle(Constants.Colors.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(24)

                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(0..<4) { rowIndex in
                            scrollingPlayerRow(isRightDirection: rowIndex % 2 == 0)
                        }
                    }
                }
            }
            .background(Constants.Colors.background)
            .scrollIndicators(.hidden)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .onAppear {
                tabNavigationManager.hideTabBar = true
                startScrollAnimation()
            }
            .onDisappear {
                tabNavigationManager.hideTabBar = false
                scrollTimer?.invalidate()
            }
        }
    }

    private var headerView: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .foregroundStyle(Constants.Colors.white)
                    .font(.system(size: 24))
            }

            Spacer()
        }
    }

    private func scrollingPlayerRow(isRightDirection: Bool) -> some View {
        // Create a container for continuous scrolling effect
        GeometryReader { geometry in
            let rowWidth = geometry.size.width

            HStack(spacing: 16) {
                // Duplicate the players
                ForEach(0..<2) { _ in
                    HStack(spacing: 16) {
                        ForEach(Player.dummyData) { player in
                            PlayerCard(player: player)
                                .frame(width: 100, height: 140)
                        }
                    }
                }
            }
            // Apply the scrolling offset based on direction
            .offset(x: isRightDirection ? rightScrollOffset : leftScrollOffset)
            .frame(height: 140)
        }
        .frame(height: 140)
        .clipped()
    }
}

#Preview {
    PlayerSeeAllScreen(players: Player.dummyData, selectedSport: .basketball)
        .environmentObject(TabNavigationManager())
}
