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

    func graph(stat: Stat, selectedDate: Date, completion: @escaping (Int) -> Void) -> some View {
        var dateDifference: Double = .infinity
        var activeIndex = 0

        for game in playerData {
            let diff = game.gameDate.timeIntervalSince1970 - selectedDate.timeIntervalSince1970
            let absDiff = abs(diff)

            if absDiff < dateDifference {
                dateDifference = absDiff
                activeIndex = playerData.firstIndex(of: game) ?? 0
            }
        }

        return (
            ZStack(alignment: .bottom) {
                Chart {
                    ForEach(Array(zip(playerData.indices, playerData)), id: \.1) { idx, data in
                        BarMark(
                            x: .value("Date", data.gameDate, unit: .weekday),
                            y: .value("Value", data.getNumberFromStat(stat))
                        )
                        .foregroundStyle(idx != activeIndex ? Constants.Colors.white : Constants.Colors.red)
                        .clipShape(Rectangle())
                        .cornerRadius(0)
                        .annotation {
                            VStack {
                                Text("\(data.getNumberFromStat(stat))")
                                    .foregroundStyle(idx != activeIndex ? Constants.Colors.white : Constants.Colors.red)
                                    .opacity(idx != activeIndex ? 0 : 1)
                                    .font(Constants.Fonts.bodyBold)
                            }
                        }
                    }
                }
                .chartXAxis {
                    AxisMarks {
                        AxisTick()
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
                .animation(.easeInOut(duration: 0.2))
                .aspectRatio(1.8, contentMode: .fit)
                .chartOverlay { pr in
                    GeometryReader { geoProxy in
                        ZStack {
                            // styled rounded rectangle
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(
                                    LinearGradient(
                                        gradient: Constants.Colors.gradient,
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 1
                                )

                            // invisible gesture response rectangle
                            Rectangle()
                                .foregroundStyle(.clear)
                                .contentShape(Rectangle())
                                .gesture(DragGesture().onChanged { value in
                                    let origin = geoProxy[pr.plotAreaFrame].origin
                                    let location = CGPoint(
                                        x: value.location.x - origin.x,
                                        y: value.location.y - origin.y
                                    )

                                    let (day, _) = pr.value(at: location, as: (Int, Double).self)!
                                    completion(day)
                                })
                                .onTapGesture(count: 1, coordinateSpace: .local, perform: { value in
                                    let origin = geoProxy[pr.plotAreaFrame].origin
                                    let location = CGPoint(
                                        x: value.x - origin.x,
                                        y: value.y - origin.y
                                    )

                                    let (day, _) = pr.value(at: location, as: (Int, Double).self)!
                                    completion(day)
                                })
                        }
                    }
                }

                Rectangle()
                    .fill(Color.white)
                    .frame(height: 1)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 5)
                    .padding(.top, 0)
            }
        )
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
