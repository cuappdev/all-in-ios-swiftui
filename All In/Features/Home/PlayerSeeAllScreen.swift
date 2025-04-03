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
    @State private var selectedSport: Sport

    // States for continuous scrolling animation
    @State private var rightScrollOffset: CGFloat = 0
    @State private var leftScrollOffset: CGFloat = 0

    // Timer for automatic scrolling
    @State private var scrollTimer: Timer?

    init(sport: Sport = Sport.all.first(where: { $0.name == "Basketball" }) ?? Sport.all[0]) {
        self._selectedSport = State(initialValue: sport)
    }

    // MARK: - Body

    var body: some View {
        NavigationStack {
            ZStack {
                Constants.Colors.background.ignoresSafeArea()

                VStack(spacing: 20) {
                    // Header
                    headerView

                    Text("Player Pack")
                        .font(Constants.Fonts.headerProfile)
                        .foregroundStyle(Constants.Colors.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)

                    Text(selectedSport.name)
                        .font(Constants.Fonts.cardHeader)
                        .foregroundStyle(Constants.Colors.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)

                    // Scrolling player rows
                    ScrollView {
                        VStack(spacing: 24) {
                            ForEach(0..<4) { rowIndex in
                                scrollingPlayerRow(isRightDirection: rowIndex % 2 == 0)
                            }
                        }
                        .padding(.vertical)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .onAppear {
                startScrollAnimation()
            }
            .onDisappear {
                scrollTimer?.invalidate()
            }
        }
    }

    // MARK: - Components

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
        .padding(.horizontal)
        .padding(.top, 20)
    }

    private func scrollingPlayerRow(isRightDirection: Bool) -> some View {
        // Create a container for continuous scrolling effect
        GeometryReader { geometry in
            let rowWidth = geometry.size.width

            HStack(spacing: 16) {
                // Duplicate the players to create continuous scrolling effect
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
        .clipped() // Clip content outside the frame
    }

    // MARK: - Animation

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
}

// MARK: - Preview

#Preview {
    PlayerSeeAllScreen()
}
