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
    @EnvironmentObject var tabNavigationManager: TabNavigationManager

    let user: User

    private func getVisibleUsers(currentUser: User) -> [User] {
        let allUsersSorted = User.dummyData.sorted(by: { $0.ranking < $1.ranking })

        guard let currentUserIndex = allUsersSorted.firstIndex(where: { $0.id == currentUser.id }) else {
            return Array(allUsersSorted.prefix(5))
        }

        let endIndex = min(currentUserIndex + 5, allUsersSorted.count)
        return Array(allUsersSorted[currentUserIndex..<endIndex])
    }

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

            if user.contracts.isEmpty {
                Text("You don't have any active bets")
                    .font(Constants.Fonts.caption)
                    .foregroundStyle(Constants.Colors.grey00)
                    .padding()
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(user.contracts) { contract in
                            ActiveBetCard(contract: contract)
                                .frame(width: 345)
                        }
                    }
                }
            }
        }
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
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(Player.dummyData.prefix(5), id: \.id) { player in
                        PlayerCard(player: player)
                    }
                }
            }
        }
        .navigationDestination(isPresented: $showPlayerInfo) {
            PlayerSeeAllScreen(sport: selectedSport)
        }
    }

    private var rankingsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Your Ranking")
                    .font(Constants.Fonts.mainHeader)
                    .foregroundStyle(Constants.Colors.white)

                NavigationLink {
                    RankingsView()
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Constants.Colors.white)
                        .font(.system(size: 12))
                }
            }

            // Ranking cards container
            VStack(spacing: 12) {
                let usersToShow = getVisibleUsers(currentUser: user)

                ForEach(usersToShow) { user in
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
    MainProfileView(user: User.dummyData[1])
        .environmentObject(TabNavigationManager())
}
