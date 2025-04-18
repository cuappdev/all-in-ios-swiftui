//
//  RankingsView.swift
//  All In
//
//  Created by jiwon jeong on 4/3/25.
//

import SwiftUI

struct RankingsView: View {

    // MARK: - Properties

    @Environment(\.dismiss) private var dismiss
    @State private var timeFilter: TimeFilter = .today
    @EnvironmentObject var tabNavigationManager: TabNavigationManager

    enum TimeFilter: String, CaseIterable {
        case today = "Today"
        case thisWeek = "This week"
        case allTime = "All time"
    }

    // MARK: - UI

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    headerView

                    timeFilterView

                    podiumView

                    rankingListView

                    Spacer()
                }
                .padding(24)
            }
            .background(Constants.Colors.background)
            .scrollIndicators(.hidden)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .onAppear {
            tabNavigationManager.hideTabBar = true
        }
        .onDisappear {
            tabNavigationManager.hideTabBar = false
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

            Text("Rankings")
                .font(Constants.Fonts.rankingTitle)
                .foregroundStyle(Constants.Colors.white)

            Spacer()

            Image(systemName: "arrow.left")
                .foregroundStyle(.clear)
                .font(.system(size: 24))
        }
    }

    private var timeFilterView: some View {
        HStack {
            ForEach(TimeFilter.allCases, id: \.self) { filter in
                Button {
                    withAnimation {
                        timeFilter = filter
                    }
                } label: {
                    Text(filter.rawValue)
                        .font(Constants.Fonts.rankingPill)
                        .foregroundStyle(Constants.Colors.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(
                            Capsule()
                                .fill(timeFilter == filter ?
                                      Constants.Colors.blackBlue : Color.clear)
                        )
                }
            }
        }
        .padding(4)
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(LinearGradient(
                    gradient: Constants.Colors.gradient,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ), lineWidth: 1)
        )
    }

    private var podiumView: some View {
        ZStack {
            // Get top 3 users
            // TODO: FIX
//            let topUsers = User.dummyData.filter { $0.ranking <= 3 }
//                .sorted { $0.ranking < $1.ranking }
            let topUsers = User.dummyData

            // Second place (right)
            if topUsers.count >= 2 {
                let secondPlace = topUsers[1]
                VStack {
                    Image(systemName: "medal.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 60, height: 60)

                    Text("@\(secondPlace.username)")
                        .font(Constants.Fonts.mainHeader)
                        .foregroundStyle(Constants.Colors.white)

                    HStack(alignment: .center, spacing: 1) {
                        Image(systemName: "dollarsign.circle")
                            .foregroundStyle(Constants.Colors.white)
                            .font(.system(size: 12))

                        Text("\(secondPlace.balance)")
                            .font(Constants.Fonts.caption)
                            .foregroundStyle(Constants.Colors.white)
                    }
                }
                .offset(x: 100, y: 40)
            }

            // First place (center)
            if !topUsers.isEmpty {
                let firstPlace = topUsers[0]
                VStack {
                    Image(systemName: "medal.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 80, height: 80)

                    Text("@\(firstPlace.username)")
                        .font(Constants.Fonts.mainHeader)
                        .foregroundStyle(Constants.Colors.white)

                    HStack(alignment: .center, spacing: 1) {
                        Image(systemName: "dollarsign.circle")
                            .foregroundStyle(Constants.Colors.white)
                            .font(.system(size: 12))

                        Text("\(firstPlace.balance)")
                            .font(Constants.Fonts.caption)
                            .foregroundStyle(Constants.Colors.white)
                    }
                }
            }

            // Third place (left)
            if topUsers.count >= 3 {
                let thirdPlace = topUsers[2]
                VStack {
                    Image(systemName: "medal.fill")
                        .resizable()
                        .foregroundColor(.brown)
                        .frame(width: 60, height: 60)

                    Text("@\(thirdPlace.username)")
                        .font(Constants.Fonts.mainHeader)
                        .foregroundStyle(Constants.Colors.white)

                    HStack(alignment: .center, spacing: 1) {
                        Image(systemName: "dollarsign.circle")
                            .foregroundStyle(Constants.Colors.white)
                            .font(.system(size: 12))

                        Text("\(thirdPlace.balance)")
                            .font(Constants.Fonts.caption)
                            .foregroundStyle(Constants.Colors.white)
                    }
                }
                .offset(x: -100, y: 40)
            }
        }
        .frame(height: 200)
    }

    private var rankingListView: some View {
        VStack(spacing: 12) {
            // TODO: FIX
//            ForEach(User.dummyData.filter { $0.ranking >= 4 }
//                .sorted(by: { $0.ranking < $1.ranking })) { user in
            ForEach(User.dummyData) { user in
                rankingRow(user: user)
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

    private func rankingRow(user: User) -> some View {
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
            Text("#1")
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
    RankingsView()
        .environmentObject(TabNavigationManager())
}
