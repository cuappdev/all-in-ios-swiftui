//
//  BetTrackerView.swift
//  All In
//
//  Created by jiwon jeong on 3/20/25.
//

import SwiftUI
import Charts

struct BetTrackerView: View {

    // MARK: - Properties

    @State private var timeFilter: TimeFilter = .weekly
    @State private var showingFAQ = false

    let user: User
    let padding: CGFloat = 24

    enum TimeFilter {
        case weekly
        case monthly
    }

    /// Calculates the Total Gain/Losses for the Selected User
    private func calculateTotalGainLoss() -> Int {
        // TODO: fix
//        let data = timeFilter == .weekly ? user.weeklyGainLoss : user.monthlyGainLoss
//        return data.reduce(0) { $0 + $1.value }
        100
    }

    /// Calculates the user's current week gain/Loss
    private func calculateCurrentWeekGainLoss() -> String {
        // TODO: fix
//        let currentWeekTotal = user.weeklyGainLoss.reduce(0) { $0 + $1.value }
//        return String(format: "%.2f", Double(currentWeekTotal) / 100.0)
        String(format: "%.2f", Double(10000) / 100.0)
    }

    /// Calculates the user's last week gain/loss
    private func calculateLastWeekGainLoss() -> Int {
        // TODO: need to make network requests for this
        400
    }

    /// Calculates the day's since user's account creation
    private func daysSinceAccountCreation() -> Int {
        // TODO: Fix
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.day], from: user.createdAt, to: Date())
//        return components.day ?? 0
        0
    }

    /// Calculating the scaling so that it is easily viewable
    private func calculateMaxScaleValue() -> Int {
        // TODO: Fix
//        let data = timeFilter == .weekly ? user.weeklyGainLoss : user.monthlyGainLoss
//        let maxAbsValue = data.map { abs($0.value) }.max() ?? 5000
//
//        // Round up to nearest 1000 for cleaner scale intervals
//        let roundedUp = Int(ceil(Double(maxAbsValue) / 1000.0) * 1000)
//        return max(1000, roundedUp)
        1000
    }

    // MARK: - UI

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    trackerCard

                    HStack(spacing: 20) {
                        totalProfitCard

                        rankingCard
                    }

                    HStack(spacing: 20) {
                        contractsSoldCard

                        accountAgeCard
                    }

                    marketplaceContracts

                    betsSection
                }
                .padding(24)
            }
            .ignoresSafeArea(edges: .bottom)
            .background(Constants.Colors.background)
        }
    }

    private var trackerCard: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack {
                Text("Your Bet Tracker")
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
                timeFilterPills

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

            gainLossChart
        }
        .navigationDestination(isPresented: $showingFAQ) {
            FrequentAskedQuestion(
                faqs: FAQ.sampleData,
                headerTitle: "How can we help?",
                subheaderTitle: "Frequently Asked Questions"
            )
        }
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

                Text("+$\(calculateTotalGainLoss())")
                    .font(Constants.Fonts.subheaderProfile)
                    .foregroundStyle(Constants.Colors.white)
            }

            HStack {
                Spacer()

                VStack(alignment: .trailing, spacing: 2) {
                    HStack(spacing: 0) {
                        Text("+\(calculateCurrentWeekGainLoss())")
                            .font(Constants.Fonts.cardHeader)
                            .foregroundStyle(Constants.Colors.moneyGreen)

                        Text(" This week")
                            .font(Constants.Fonts.cardHeader)
                            .foregroundStyle(Constants.Colors.white)
                    }

                    HStack(spacing: 0) {
                        Text("+$\(calculateLastWeekGainLoss())")
                            .font(Constants.Fonts.cardHeader)
                            .foregroundStyle(Constants.Colors.moneyGreen)

                        Text(" Last week")
                            .font(Constants.Fonts.cardHeader)
                            .foregroundStyle(Constants.Colors.white)
                    }
                }
            }

            chart
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

    private var chart: some View {
        // Define data outside the chart
        // TODO: Fix
//        let data = timeFilter == .weekly ? user.weeklyGainLoss : user.monthlyGainLoss
        let data: [DailyGainLoss] = []
        let maxValue = calculateMaxScaleValue()
        let negMaxValue = -maxValue

        // Create chart base
        let chartContent = Chart {
            // Bar marks in a separate ForEach
            ForEach(data, id: \.day) { item in
                BarMark(
                    x: .value("Day", item.day),
                    y: .value("Value", item.value)
                )
                .foregroundStyle(item.value >= 0 ? Constants.Colors.greenChart : Constants.Colors.redChart)
                .cornerRadius(0)
            }

            // Add reference marks separately
            zeroMark
            upperLine
        }

        // Apply chart customizations in steps
        let chartWithScaling = chartContent
            .chartYScale(domain: negMaxValue...maxValue)

        let chartWithYAxis = chartWithScaling
            .chartYAxis {
                yAxis
            }

        let chartWithBothAxes = chartWithYAxis
            .chartXAxis {
                xAxis
            }

        // Final styling
        return chartWithBothAxes
            .frame(height: 165)
            .padding(.top, 16)
    }
    private var zeroMark: some ChartContent {
        RuleMark(y: .value("Zero", 0))
            .lineStyle(StrokeStyle(lineWidth: 1, dash: [2, 2]))
            .foregroundStyle(Constants.Colors.white)
    }

    private var upperLine: some ChartContent {
        RuleMark(y: .value("Upper Line", -calculateMaxScaleValue()))
            .lineStyle(StrokeStyle(lineWidth: 1))
            .foregroundStyle(Constants.Colors.white)
    }

    private var yAxis: some AxisContent {
        let maxValue = calculateMaxScaleValue()

        return AxisMarks(position: .leading, values: [-maxValue, -maxValue/2, 0, maxValue/2, maxValue]) { value in
            AxisGridLine()
            AxisTick()
            AxisValueLabel {
                if let intValue = value.as(Int.self) {
                    Text("\(intValue)")
                        .font(Constants.Fonts.caption)
                        .foregroundStyle(Constants.Colors.white)
                }
            }
        }

    }

    private var xAxis: some AxisContent {
        AxisMarks(values: timeFilter == .weekly ? [
            "M",
            "T",
            "W",
            "TH",
            "F",
            "S",
            "SU"
        ] : Array(1...4).map { "\($0)" }) { value in
            AxisValueLabel {
                if let day = value.as(String.self) {
                    Text(day)
                        .font(Constants.Fonts.caption)
                        .foregroundStyle(Constants.Colors.white)
                }
            }
        }
    }

    private var totalProfitCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Total Profit")
                .font(Constants.Fonts.cardHeader)
                .foregroundStyle(Constants.Colors.white)

            // TODO: Fix
//            Text("$\(user.totalProfit)")
            Text("$1000")
                .font(Constants.Fonts.cardContent)
                .foregroundStyle(Constants.Colors.white)
                .padding(.top, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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

    private var rankingCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Ranking No.")
                .font(Constants.Fonts.cardHeader)
                .foregroundStyle(Constants.Colors.white)

            // TODO: Fix
//            Text("\(user.ranking)")
            Text("#1")
                .font(Constants.Fonts.cardContent)
                .foregroundStyle(Constants.Colors.white)
                .padding(.top, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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

    private var contractsSoldCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("No. of Contracts Sold")
                .font(Constants.Fonts.cardHeader)
                .foregroundStyle(Constants.Colors.white)

            Text("\(user.sellerTransactions.count)")
                .font(Constants.Fonts.cardContent)
                .foregroundStyle(Constants.Colors.white)
                .padding(.top, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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

    private var accountAgeCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Age of Account")
                .font(Constants.Fonts.cardHeader)
                .foregroundStyle(Constants.Colors.white)

            Text("\(daysSinceAccountCreation()) days")
                .font(Constants.Fonts.cardContent)
                .foregroundStyle(Constants.Colors.white)
                .padding(.top, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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

    private var marketplaceContracts: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack(spacing: 4) {
                Text("Recommended Marketplace Contracts")
                    .font(Constants.Fonts.marketPlaceTitle)
                    .foregroundStyle(Constants.Colors.white)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(Contract.dummyData.prefix(5), id: \.id) { contract in
                        ContractCard(contract: contract, onTap: {})
                            .frame(width: 180)
                    }
                }
                .padding(padding)
            }
            .padding(-padding)
        }
        .padding(.top, 16)
    }

    private var betsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Active Bets")
                    .font(Constants.Fonts.marketPlaceTitle)
                    .foregroundStyle(Constants.Colors.white)
            }

            if user.contracts.isEmpty {
                Text("You don't have any active bets")
                    .font(Constants.Fonts.caption)
                    .foregroundStyle(Constants.Colors.grey00)
                    .padding()
            } else {
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(user.contracts) { contract in
                            ActiveBetCard(contract: contract)
                        }
                    }
                    .padding(padding)
                }
                .padding(-padding)
            }
        }
        .padding(.top, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

}

#Preview {
    BetTrackerView(user: User.dummyData[0])
        .environmentObject(TabNavigationManager())
}
