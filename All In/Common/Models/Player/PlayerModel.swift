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
    var position: [String]
    var number: Int
    var height: Int
    var weight: Int
    var hometown: String
    var highschool: String
    var contracts: [Contract]
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
            Chart {
                ForEach(Array(zip(playerData.indices, playerData)), id: \.1) { idx, data in
                    BarMark(
                        x: .value("Date", data.gameDate, unit: .weekday),
                        y: .value("Value", data.getNumberFromStat(stat))
                    )
                    .foregroundStyle(idx != activeIndex ? Constants.Colors.grey02 : Constants.Colors.red)
                    .cornerRadius(5)
                    .annotation {
                        VStack {
                            Image("fordham")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 20)
                                .foregroundStyle(idx != activeIndex ? Constants.Colors.grey02 : Constants.Colors.red)
                                .opacity(idx != activeIndex ? 0 : 1)
                            Text("\(data.getNumberFromStat(stat))")
                                .foregroundStyle(idx != activeIndex ? Constants.Colors.grey02 : Constants.Colors.red)
                                .opacity(idx != activeIndex ? 0 : 1)
                                .font(Constants.Fonts.bodyBold)
                        }
                    }
                }
            }
            .animation(.easeInOut(duration: 0.2))
            .aspectRatio(1.0, contentMode: .fit)
            .chartOverlay { pr in
                GeometryReader { geoProxy in
                    Rectangle()
                        .foregroundStyle(.black.opacity(0.0001))
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
        )
    }

}

extension Player {

    static let dummyData: [Player] = [
        Player(
            id: 0,
            firstName: "Evan",
            lastName: "Williams",
            position: ["Forward"],
            number: 0,
            height: 79,
            weight: 220,
            hometown: "Murphy, Texas",
            highschool: "Plano East Senior HS",
            contracts: Contract.dummyData,
            playerData: PlayerData.dummyData
        ),
        Player(
            id: 1,
            firstName: "Nazir",
            lastName: "Williams",
            position: ["Guard"],
            number: 1,
            height: 75,
            weight: 180,
            hometown: "Nyack, New York",
            highschool: "Blair Academy",
            contracts: Contract.dummyData,
            playerData: PlayerData.dummyData
        ),
        Player(
            id: 2,
            firstName: "Ian",
            lastName: "Imegwu",
            position: ["Forward"],
            number: 2,
            height: 81,
            weight: 226,
            hometown: "Short Hills, New Jersey",
            highschool: "Blair Academy",
            contracts: Contract.dummyData,
            playerData: PlayerData.dummyData
        ),
        Player(
            id: 3,
            firstName: "Ryan",
            lastName: "Kiachian",
            position: ["Forward", "Center"],
            number: 3,
            height: 82,
            weight: 228,
            hometown: "Los Altos Hills, California",
            highschool: "Bellarmine College Preparatory",
            contracts: Contract.dummyData,
            playerData: PlayerData.dummyData
        ),
        Player(
            id: 4,
            firstName: "Dylan",
            lastName: "Wang",
            position: ["Guard"],
            number: 4,
            height: 72,
            weight: 170,
            hometown: "Los Altos Hills, California",
            highschool: "Bellarmine College Preparatory",
            contracts: Contract.dummyData,
            playerData: PlayerData.dummyData
        )
    ]

}
