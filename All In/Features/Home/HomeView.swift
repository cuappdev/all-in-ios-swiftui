//
//  MainProfileView.swift
//  All In
//
//  Created by jiwon jeong on 4/1/25.
//
import SwiftUI

struct HomeView: View {

    // MARK: - Properties

    @State private var players = Player.dummyData
    @State private var showRarityInfo = false
    @State private var showPlayerInfo = false
    @State private var showRankingInfo = false
    @State private var showingFAQ = false
    @State private var showCartView = false
    @State private var selectedSport: Sport = Sport.all.first(where: { $0.name == "Basketball" }) ?? Sport.all[0]
    @EnvironmentObject var tabNavigationManager: TabNavigationManager
    @State private var visibleUsers: [User] = []

    var padding: CGFloat = 24

    let user: User

    private func getVisibleUsers() async {
        do {
            let users = try await NetworkManager.shared.getUsers(size: 5, sortBy: "balance", direction: "desc")
            await MainActor.run {
                visibleUsers = users
            }
        } catch {
            NetworkManager.shared.logger.error("Failed to fetch visible users: \(error)")
        }
    }

    // MARK: - UI

    var body: some View {
        ZStack {
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
                    .padding(padding)
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
                .navigationDestination(isPresented: $showCartView) {
                    CartView(user: user)
                }
                .onAppear {
//                    Task {
//                        do {
//                            let networkedPlayers = try await NetworkManager.shared.getPlayers()
//                            guard !networkedPlayers.isEmpty else { return }
//                            
//                            await MainActor.run {
//                                players = networkedPlayers
//                            }
//                        } catch {
//                            NetworkManager.shared.logger.error("Error in \(#file) \(#function): \(error)")
//                        }
//                    }
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        showCartView = true
                    }) {
                        Image("cart")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }
                        .padding(.bottom, 15)
                        .padding(.trailing, 15)
                }
            }
        }
        .onAppear {
            Task {
                await getVisibleUsers()
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
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var sportFilterPills: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                let basketball = Sport.all.first(where: { $0.name == "Basketball" }) ?? Sport.all[0]
                SportPill(
                    sport: basketball,
                    isSelected: selectedSport == basketball
                ) {
                    selectedSport = basketball
                }

                ForEach(Sport.all.filter { $0.name != "Basketball" }) { sport in
                    SportPill(
                        sport: sport,
                        isSelected: false,
                        isDisabled: true
                    ) {
                        // Empty action
                    }
                }
            }
            .padding(.horizontal, 4)
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
                Text("Players")
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
                    ForEach(players, id: \.id) { player in
                        PlayerCard(player: player)
                    }
                }
                .padding(padding)
            }
            .padding(-padding)
        }
        .navigationDestination(isPresented: $showPlayerInfo) {
            PlayerSeeAllScreen(players: players, selectedSport: selectedSport)
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

            VStack(spacing: 12) {
                if visibleUsers.isEmpty {
                    Text("No rankings to display right now.")
                        .font(Constants.Fonts.caption)
                        .foregroundStyle(Constants.Colors.grey00)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                } else {
                    ForEach(Array(visibleUsers.enumerated()), id: \.element.id) { index, user in
                        rankingCard(user: user, rank: index + 1)
                    }
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


    private func rankingCard(user: User, rank: Int) -> some View {
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

            // TODO: FIX
//            Text("#\(user.ranking)")
            Text("#\(rank)")
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
    HomeView(user: User.dummyData[1])
        .environmentObject(TabNavigationManager())
}
