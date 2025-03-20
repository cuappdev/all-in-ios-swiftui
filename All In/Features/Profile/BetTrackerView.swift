//
//  BetTrackerView.swift
//  All In
//
//  Created by jiwon jeong on 3/20/25.
//

import SwiftUI
import Charts

struct BetTrackerView: View {

    @StateObject var viewModel = ViewModel()
    @EnvironmentObject var profileViewModel: ProfileViewViewModel

    @Binding var tabSelection: Int
    @State private var timeFilter: TimeFilter = .weekly

    @State private var showingFAQ = false

    enum TimeFilter {
        case weekly
        case monthly
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                content

                TabBar(page: "bet-tracker")
                    .frame(height: 108)
            }
            .ignoresSafeArea(edges: .bottom)
            .background(Constants.Colors.background)
            .navigationDestination(isPresented: $showingFAQ) {
                FrequentAskedQuestion()
            }
        }
    }

    private var content: some View {
        ScrollView {
            VStack(spacing: 16) {
                trackerCard

                HStack(spacing: 17) {
                    totalProfitCard
                    rankingCard
                }

                HStack(spacing: 17) {
                    contractsSoldCard
                    accountAgeCard
                }
            }
            .padding(24)
        }
    }

    private var trackerCard: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack {
                Text("Your Bet Tracker")
                    .font(Constants.Fonts.header)
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
                timeFilterPills

                Spacer()

                HStack(spacing: 7) {
                    Image(systemName: "dollarsign.circle")
                        .foregroundStyle(Constants.Colors.white)
                        .font(.system(size: 24))

                    Text("1000")
                        .font(Constants.Fonts.subheader)
                        .foregroundStyle(Constants.Colors.white)
                }
            }

            gainLossChart
        }
        .cornerRadius(16)
    }

    private var timeFilterPills: some View {
        HStack(spacing: 0) {
            Pill(title: "Weekly", isSelected: timeFilter == .weekly) {
                timeFilter = .weekly
            }

            Pill(title: "Monthly", isSelected: timeFilter == .monthly) {
                timeFilter = .monthly
            }
        }
        .padding(4)
        .background(Constants.Colors.blackBlue)
        .cornerRadius(28)
    }

    private var gainLossChart: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Gains/Losses")
                    .font(Constants.Fonts.profileCard)
                    .foregroundStyle(Constants.Colors.white)

                Spacer()

                Text("+$20")
                    .font(Constants.Fonts.subheader)
                    .foregroundStyle(Constants.Colors.white)
            }

            HStack {
                Spacer()

                VStack(alignment: .trailing, spacing: 2) {
                    HStack(spacing: 0) {
                        Text("+0.00")
                            .font(Constants.Fonts.body)
                            .foregroundStyle(Constants.Colors.green)

                        Text(" This week")
                            .font(Constants.Fonts.body)
                            .foregroundStyle(Constants.Colors.white)
                    }

                    HStack(spacing: 0) {
                        Text("+$50.00")
                            .font(Constants.Fonts.body)
                            .foregroundStyle(Constants.Colors.green)

                        Text(" Last week")
                            .font(Constants.Fonts.body)
                            .foregroundStyle(Constants.Colors.white)
                    }
                }
            }

            Chart {
                ForEach(viewModel.weeklyData, id: \.day) { item in
                    BarMark(
                        x: .value("Day", item.day),
                        y: .value("Value", item.value)
                    )
                    .foregroundStyle(item.value >= 0 ? Constants.Colors.greenChart : Constants.Colors.redChart)
                    .cornerRadius(0)
                }

                RuleMark(y: .value("Zero", 0))
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [2, 2]))
                    .foregroundStyle(Constants.Colors.white)

                RuleMark(y: .value("Upper Line", -5000))
                    .lineStyle(StrokeStyle(lineWidth: 1))
                    .foregroundStyle(Constants.Colors.white)

            }
            .chartYScale(domain: -5000...5000)
            .chartYAxis {
                AxisMarks(position: .leading, values: [-5000, -2500, 0, 2500, 5000]) { value in
                    AxisValueLabel {
                        if let intValue = value.as(Int.self) {
                            Text("\(intValue)")
                                .font(Constants.Fonts.caption)
                                .foregroundStyle(Constants.Colors.white)
                        }
                    }
                }
            }
            .chartXAxis {
                AxisMarks(values: ["M", "T", "W", "TH", "F", "S", "SU"]) { value in
                    AxisValueLabel {
                        if let day = value.as(String.self) {
                            Text(day)
                                .font(Constants.Fonts.caption)
                                .foregroundStyle(Constants.Colors.white)
                        }
                    }
                }
            }
            .frame(height: 165)
            .padding(.top, 8)
        }
        .padding(16)
        .background(Constants.Colors.blackBlue)
        .cornerRadius(16)
        .frame(height: 269)
    }

    private var totalProfitCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Total Profit")
                .font(Constants.Fonts.cardHeader)
                .foregroundStyle(Constants.Colors.white)

            Text("$64")
                .font(Constants.Fonts.cardContent)
                .foregroundStyle(Constants.Colors.white)
                .padding(.top, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Constants.Colors.blackBlue)
        .cornerRadius(16)
    }

    private var rankingCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Ranking No.")
                .font(Constants.Fonts.cardHeader)
                .foregroundStyle(Constants.Colors.white)

            Text("52")
                .font(Constants.Fonts.cardContent)
                .foregroundStyle(Constants.Colors.white)
                .padding(.top, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Constants.Colors.blackBlue)
        .cornerRadius(16)
    }

    private var contractsSoldCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("No. of Contracts Sold")
                .font(Constants.Fonts.cardHeader)
                .foregroundStyle(Constants.Colors.white)

            Text("7")
                .font(Constants.Fonts.cardContent)
                .foregroundStyle(Constants.Colors.white)
                .padding(.top, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Constants.Colors.blackBlue)
        .cornerRadius(16)
    }

    private var accountAgeCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Age of Account")
                .font(Constants.Fonts.cardHeader)
                .foregroundStyle(Constants.Colors.white)

            Text("17 days")
                .font(Constants.Fonts.cardContent)
                .foregroundStyle(Constants.Colors.white)
                .padding(.top, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Constants.Colors.blackBlue)
        .cornerRadius(16)
    }
}

// Custom pill button component
struct Pill: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Constants.Fonts.pillButton)
                .foregroundStyle(Constants.Colors.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .frame(height: 39)
                .background(isSelected ? Constants.Colors.background : Color.clear)
                .cornerRadius(20)
        }
    }
}

#Preview {
    BetTrackerView(tabSelection: .constant(2))
        .environmentObject(ProfileViewViewModel())
}
