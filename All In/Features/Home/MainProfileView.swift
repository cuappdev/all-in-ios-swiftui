//
//  MainProfileView.swift
//  All In
//
//  Created by jiwon jeong on 4/1/25.
//
import SwiftUI

struct MainProfileView: View {

    // MARK: - Properties

    @State private var showRarityInfo = false
    @State private var showPlayerInfo = false
    @State private var showRankingInfo = false
    @State private var showingFAQ = false
    @State private var selectedSport: Sport = Sport.all.first(where: { $0.name == "Basketball" }) ?? Sport.all[0]

    let user: User

    // MARK: - UI

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    profileCard

                    activeBetsSection

                    sportFilterPills

                    raritySection

                    playersSection

                    rankingsSection
                }
                .padding(24)
            }
            .background(Constants.Colors.background)
            .ignoresSafeArea(edges: .bottom)
            .navigationDestination(isPresented: $showingFAQ) {
                FrequentAskedQuestion()
            }
        }
    }

    private var profileCard: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack {
                Text("All In")
                    .font(Constants.Fonts.headerProfile)
                    .foregroundStyle(Constants.Colors.white)

                Spacer()

                Button(action: {
                    showingFAQ = true
                }) {
                    Image(systemName: "questionmark.circle")
                        .foregroundStyle(Constants.Colors.white)
                        .font(.system(size: 24))
                }
            }

            HStack {
                Spacer()

                HStack(spacing: 7) {
                    Image(systemName: "dollarsign.circle")
                        .foregroundStyle(Constants.Colors.white)
                        .font(.system(size: 24))

                    Text("\(user.balance)")
                        .font(Constants.Fonts.subheaderProfile)
                        .foregroundStyle(Constants.Colors.white)
                }
            }
        }
    }

    private var activeBetsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("My Active Bets")
                    .font(Constants.Fonts.mainHeader)
                    .foregroundStyle(Constants.Colors.white)
                Image(systemName: "chevron.right")
                    .foregroundStyle(Constants.Colors.white)
                    .font(.system(size: 12))
            }

            // Sample active bet card
            activeBetCard
        }
    }

    private var activeBetCard: some View {
        HStack(spacing: 12) {
            // Player image
            Image("Player1") // Replace with actual player image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text("Jake Shane v. Harvard")
                    .font(Constants.Fonts.cardHeader)
                    .foregroundStyle(Constants.Colors.white)

                Text("01/24 | Men's Ice Hockey")
                    .font(Constants.Fonts.caption)
                    .foregroundStyle(Constants.Colors.white)

                Text("Scores first goal of game")
                    .font(Constants.Fonts.caption)
                    .foregroundStyle(Constants.Colors.white)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text("Cost: 20.00")
                    .font(Constants.Fonts.caption)
                    .foregroundStyle(Constants.Colors.redChart)

                Text("Gain: 40.00")
                    .font(Constants.Fonts.caption)
                    .foregroundStyle(Constants.Colors.moneyGreen)
            }
        }
        .padding(16)
        .background(Constants.Colors.blackBlue)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(LinearGradient(gradient: Constants.Colors.gradient, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
        )
    }

    private var sportFilterPills: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(Sport.all) { sport in
                        SportPill(
                            sport: sport,
                            isSelected: selectedSport == sport
                        ) {
                            selectedSport = sport
                        }
                    }
                }
                .padding(.vertical, 4)
            }
        }
    }

    private var raritySection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Rarity")
                .font(Constants.Fonts.mainHeader)
                .foregroundStyle(Constants.Colors.white)

            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    RarityPackView(price: 1000, rarity: .common)
                    RarityPackView(price: 2000, rarity: .rare)
                }

                HStack(spacing: 16) {
                    RarityPackView(price: 3000, rarity: .epic)
                    RarityPackView(price: 4000, rarity: .legendary)
                }
            }
        }
    }

    // MARK: - Players Section

    private var playersSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Player")
                    .font(Constants.Fonts.header)
                    .foregroundStyle(Constants.Colors.white)

                Spacer()

                Button(action: {
                    showPlayerInfo = true
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Constants.Colors.white)
                        .font(.system(size: 16))
                }
                .sheet(isPresented: $showPlayerInfo) {
                    Text("Player Info") // Replace with actual info view
                        .presentationDetents([.fraction(0.7)])
                }
            }

            // Player cards
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(1...3, id: \.self) { _ in
                        playerCard
                    }
                }
            }
        }
    }

    private var playerCard: some View {
        VStack(alignment: .center, spacing: 8) {
            Image("Player1") // Replace with actual player image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .padding(.top, 16)

            Text("C. Manon")
                .font(Constants.Fonts.cardHeader)
                .foregroundStyle(Constants.Colors.white)

            Text("#14 | PG")
                .font(Constants.Fonts.caption)
                .foregroundStyle(Constants.Colors.white)
                .padding(.bottom, 16)
        }
        .frame(width: 100, height: 140)
        .background(Constants.Colors.blackBlue)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(LinearGradient(gradient: Constants.Colors.gradient, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
        )
    }

    // MARK: - Rankings Section

    private var rankingsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Your Ranking")
                    .font(Constants.Fonts.header)
                    .foregroundStyle(Constants.Colors.white)

                Spacer()

                Button(action: {
                    showRankingInfo = true
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Constants.Colors.white)
                        .font(.system(size: 16))
                }
                .sheet(isPresented: $showRankingInfo) {
                    Text("Ranking Info") // Replace with actual info view
                        .presentationDetents([.fraction(0.7)])
                }
            }

            // Ranking cards
            VStack(spacing: 12) {
                ForEach(1...5, id: \.self) { index in
                    rankingCard(rank: index + 3)
                }
            }
        }
    }

    private func rankingCard(rank: Int) -> some View {
        HStack {
            Text("@username")
                .font(Constants.Fonts.cardHeader)
                .foregroundStyle(Constants.Colors.white)

            Text("T3")
                .font(Constants.Fonts.caption)
                .foregroundStyle(Constants.Colors.white)

            Text("@1000")
                .font(Constants.Fonts.caption)
                .foregroundStyle(Constants.Colors.white)

            Spacer()

            Text("#\(rank)")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(Constants.Colors.white)
        }
        .padding(16)
        .background(Constants.Colors.blackBlue)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(LinearGradient(gradient: Constants.Colors.gradient, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
        )
    }
}

#Preview {
    MainProfileView(user: User.dummyData[0])
}
