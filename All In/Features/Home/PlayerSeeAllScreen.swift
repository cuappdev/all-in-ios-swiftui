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
    @EnvironmentObject var tabNavigationManager: TabNavigationManager

    // States for continuous scrolling animation
    @State private var rowOffsets: [CGFloat] = [0, 0, 0, 0]

    // Track user interaction with gesture
    @State private var userScrolling: [Bool] = [false, false, false, false]
    @State private var userScrollOffset: [CGFloat] = [0, 0, 0, 0]

    // Display Link for smoother animation
    @State private var displayLink: Timer?

    init(sport: Sport = Sport.all.first(where: { $0.name == "Basketball" }) ?? Sport.all[0]) {
        self._selectedSport = State(initialValue: sport)
    }

    private func startScrollAnimation() {
        // Calculate the total width of one set of players
        let playerWidth: CGFloat = 100 + 16 // Card width + spacing
        let totalWidth = CGFloat(Player.dummyData.count) * playerWidth

        // Initialize offsets
        for i in 0..<rowOffsets.count {
            rowOffsets[i] = i % 2 == 0 ? 0 : -totalWidth
        }

        // Create a display link for smooth animation
        displayLink = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { _ in
            // Update scroll offsets for rows not being interacted with
            for i in 0..<rowOffsets.count {
                if !userScrolling[i] {
                    if i % 2 == 0 {
                        // Right-moving row
                        rowOffsets[i] -= 0.5
                        if rowOffsets[i] < -totalWidth {
                            rowOffsets[i] = 0
                        }
                    } else {
                        // Left-moving row
                        rowOffsets[i] += 0.5
                        if rowOffsets[i] > 0 {
                            rowOffsets[i] = -totalWidth
                        }
                    }
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

                VStack(spacing: 20) {
                    ForEach(0..<4) { rowIndex in
                        scrollablePlayerRow(rowIndex: rowIndex)
                    }
                }
                .padding(.bottom, 24)
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
                displayLink?.invalidate()
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

    private func scrollablePlayerRow(rowIndex: Int) -> some View {
        let isRightDirection = rowIndex % 2 == 0

        return GeometryReader { geometry in
            let rowWidth = geometry.size.width
            let playerWidth: CGFloat = 100 + 16 // Card width + spacing
            let totalWidth = CGFloat(Player.dummyData.count) * playerWidth

            HStack(spacing: 16) {
                // Duplicate the players for continuous effect
                ForEach(0..<2) { _ in
                    HStack(spacing: 16) {
                        ForEach(Player.dummyData) { player in
                            PlayerCard(player: player)
                                .frame(width: 100, height: 140)
                        }
                    }
                }
            }
            .offset(x: rowOffsets[rowIndex] + userScrollOffset[rowIndex])
            .gesture(
                DragGesture()
                    .onChanged { value in
                        userScrolling[rowIndex] = true
                        userScrollOffset[rowIndex] = value.translation.width
                    }
                    .onEnded { _ in
                        // Update the base offset with the final user gesture
                        rowOffsets[rowIndex] += userScrollOffset[rowIndex]

                        // Reset user offset
                        userScrollOffset[rowIndex] = 0

                        // Handle edge cases
                        if isRightDirection {
                            if rowOffsets[rowIndex] > 0 {
                                rowOffsets[rowIndex] = 0
                            } else if rowOffsets[rowIndex] < -totalWidth {
                                rowOffsets[rowIndex] = -totalWidth
                            }
                        } else {
                            if rowOffsets[rowIndex] < -totalWidth {
                                rowOffsets[rowIndex] = -totalWidth
                            } else if rowOffsets[rowIndex] > 0 {
                                rowOffsets[rowIndex] = 0
                            }
                        }

                        // Resume animation after a short delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            userScrolling[rowIndex] = false
                        }
                    }
            )
        }
        .frame(height: 140)
        .clipped()
    }
}

#Preview {
    PlayerSeeAllScreen()
        .environmentObject(TabNavigationManager())
}
