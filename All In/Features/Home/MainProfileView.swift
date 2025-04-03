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
                FrequentAskedQuestion(
                    faqs: FAQ.homeFAQs,
                    headerTitle: "FAQs About Home",
                    subheaderTitle: "Frequently Asked Questions"
                )
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
            Image("Player1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text("Jake Shane v. Harvard")
                    .font(Constants.Fonts.mainHeader)
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
                .stroke(LinearGradient(
                    gradient: Constants.Colors.gradient,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ), lineWidth: 1)
        )
    }

    private var sportFilterPills: some View {            ScrollView(.horizontal, showsIndicators: false) {
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

    private var playersSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack {
                Text("Player")
                    .font(Constants.Fonts.mainHeader)
                    .foregroundStyle(Constants.Colors.white)

                Button(action: {
                    showPlayerInfo = true
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Constants.Colors.white)
                        .font(.system(size: 12))
                }
                .sheet(isPresented: $showPlayerInfo) {
                    Text("Player Info")
                        .presentationDetents([.fraction(0.7)])
                }
            }

            // Player cards
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(Player.dummyData.prefix(5), id: \.id) { player in
                        PlayerCard(player: player)
                    }
                }
                .padding(.leading, 0.5)
                .padding(.top, 0.5)
                .padding(.bottom, 0.5)
            }
        }
    }

    private var rankingsSection: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Your Ranking")
                        .font(Constants.Fonts.mainHeader)
                        .foregroundStyle(Constants.Colors.white)

                    Button(action: {
                        showRankingInfo = true
                    }) {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Constants.Colors.white)
                            .font(.system(size: 12))
                    }
                }

                // Ranking cards
                VStack(spacing: 12) {
                    ForEach(User.dummyData.sorted(by: { $0.ranking < $1.ranking })) { user in
                        rankingCard(user: user)
                    }
                }
                .padding(16)
                .background(Constants.Colors.blackBlue)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(LinearGradient(
                            gradient: Constants.Colors.gradient,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ), lineWidth: 1)
                )
            }
            .navigationDestination(isPresented: $showRankingInfo) {
                RankingsView()
            }
        }
    }

    private func rankingCard(user: User) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("@\(user.username)")
                    .font(Constants.Fonts.cardHeader)
                    .foregroundStyle(Constants.Colors.white)

                HStack(alignment: .center, spacing: 1) {
                    Image(systemName: "dollarsign.circle")
                        .foregroundStyle(Constants.Colors.white)
                        .font(.system(size: 12))

                    Text("\(user.balance)")
                        .font(Constants.Fonts.caption)
                        .foregroundStyle(Constants.Colors.white)
                }
            }

            Spacer()

            Text("#\(user.ranking)")
                .font(Constants.Fonts.cardHeader)
                .foregroundStyle(Constants.Colors.white)
        }
        .padding(16)
        .background(Constants.Colors.blackBlue)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(LinearGradient(
                    gradient: Constants.Colors.gradient,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ), lineWidth: 1)
        )
    }
}

#Preview {
    MainProfileView(user: User.dummyData[0])
}
