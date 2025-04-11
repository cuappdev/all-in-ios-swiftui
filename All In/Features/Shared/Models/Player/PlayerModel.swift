//
//  PlayerModel.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI
import Charts

// https://cornellbigred.com/sports/mens-basketball/roster
// TODO: Add the rest of the data

struct Player: Identifiable, Codable {
    var id: Int
    var firstName: String
    var lastName: String
    var positions: [String]
    var number: Int
    var height: String
    var weight: Int
    var hometown: String
    var highSchool: String
    var image: String
    var contracts: [String]
    var playerData: [PlayerData]

    func graph(stat: Stat, selectedDate: Date, onDateSelected: @escaping (Int) -> Void) -> some View {
        // Find the closest data point to the selected date
        let activeIndex = playerData.indices.min(by: { i, j in
            let diff1 = abs(playerData[i].gameDate.timeIntervalSince1970 - selectedDate.timeIntervalSince1970)
            let diff2 = abs(playerData[j].gameDate.timeIntervalSince1970 - selectedDate.timeIntervalSince1970)
            return diff1 < diff2
        }) ?? 0

        return ZStack(alignment: .bottom) {
            if playerData.isEmpty {
                HStack(alignment: .center) {
                    Text("No Data for this Player")
                        .foregroundStyle(Constants.Colors.white)
                }
                .frame(maxWidth: .infinity)
            } else {
                Chart {
                    ForEach(Array(zip(playerData.indices, playerData)), id: \.1) { idx, data in
                        BarMark(
                            x: .value("Date", data.gameDate, unit: .weekday),
                            y: .value("Value", data.getNumberFromStat(stat))
                        )
                        .foregroundStyle(idx != activeIndex ? Constants.Colors.white : Constants.Colors.red)
                        .cornerRadius(0)
                        .annotation {
                            Text("\(data.getNumberFromStat(stat))")
                                .foregroundStyle(idx != activeIndex ? Constants.Colors.white : Constants.Colors.red)
                                .opacity(idx != activeIndex ? 0 : 1)
                                .font(Constants.Fonts.bodyBold)
                        }
                    }
                }
                .chartXAxis {
                    AxisMarks {
                        AxisTick()
                        AxisValueLabel()
                            .foregroundStyle(Constants.Colors.white)
                    }
                }
                .chartYAxis {
                    AxisMarks(position: .leading) {
                        AxisTick()
                        AxisValueLabel()
                            .foregroundStyle(Constants.Colors.white)
                    }
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 10)
                .animation(.easeInOut(duration: 0.2), value: activeIndex)
                .aspectRatio(1.8, contentMode: .fit)
                .chartOverlay { proxy in
                    GeometryReader { geometry in
                        Rectangle()
                            .fill(Color.clear)
                            .contentShape(Rectangle())
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        handleChartInteraction(
                                            at: value.location,
                                            in: geometry,
                                            proxy: proxy,
                                            onDateSelected: onDateSelected
                                        )
                                    }
                            )
                            .onTapGesture { location in
                                handleChartInteraction(
                                    at: location,
                                    in: geometry,
                                    proxy: proxy,
                                    onDateSelected: onDateSelected
                                )
                            }

                        // Border
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(
                                LinearGradient(
                                    gradient: Constants.Colors.gradient,
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    }
                }

                // Bottom line
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 1)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 5)
            }

        }
    }

    // Helper function to handle chart interactions
    private func handleChartInteraction(
        at location: CGPoint,
        in geometry: GeometryProxy,
        proxy: ChartProxy,
        onDateSelected: @escaping (Int) -> Void
    ) {
        let origin = geometry[proxy.plotAreaFrame].origin
        let chartPoint = CGPoint(
            x: location.x - origin.x,
            y: location.y - origin.y
        )

        // Make sure we're handling the point within the chart's bounds
        guard let (day, _) = proxy.value(at: chartPoint, as: (Int, Double).self) else {
            return
        }

        onDateSelected(day)
    }
}

extension Player {
    static let dummyData: [Player] = [
        Player(
            id: 0,
            firstName: "Evan",
            lastName: "Williams",
            positions: ["GUARD", "FORWARD"],
            number: 0,
            height: "79",
            weight: 220,
            hometown: "Murphy, Texas",
            highSchool: "Plano East Senior HS",
            image: "",
            contracts: ["Standard NBA Contract 2024-2025"],
            playerData: PlayerData.dummyData
        ),
        Player(
            id: 1,
            firstName: "Nazir",
            lastName: "Williams",
            positions: ["GUARD"],
            number: 1,
            height: "75",
            weight: 180,
            hometown: "Nyack, New York",
            highSchool: "Blair Academy",
            image: "",
            contracts: ["Two-way Contract 2024-2026"],
            playerData: PlayerData.dummyData
        ),
        Player(
            id: 2,
            firstName: "Ian",
            lastName: "Imegwu",
            positions: ["FORWARD"],
            number: 2,
            height: "81",
            weight: 226,
            hometown: "Short Hills, New Jersey",
            highSchool: "Blair Academy",
            image: "",
            contracts: ["Rookie Contract 2024-2028"],
            playerData: PlayerData.dummyData
        ),
        Player(
            id: 3,
            firstName: "Ryan",
            lastName: "Kiachian",
            positions: ["FORWARD", "CENTER"],
            number: 3,
            height: "82",
            weight: 228,
            hometown: "Los Altos Hills, California",
            highSchool: "Bellarmine College Preparatory",
            image: "",
            contracts: ["Standard NBA Contract 2023-2025"],
            playerData: PlayerData.dummyData
        ),
        Player(
            id: 4,
            firstName: "Dylan",
            lastName: "Wang",
            positions: ["GUARD"],
            number: 5,
            height: "72",
            weight: 170,
            hometown: "Los Altos Hills, California",
            highSchool: "Bellarmine College Preparatory",
            image: "",
            contracts: ["Exhibit 10 Contract 2024"],
            playerData: PlayerData.dummyData
        )
    ]
}
