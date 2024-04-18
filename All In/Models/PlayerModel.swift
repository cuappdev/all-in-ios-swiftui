//
//  PlayerModel.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

// https://cornellbigred.com/sports/mens-basketball/roster
// TODO: Add the rest of the data

struct Player {
    var id: Int
    var name: String
    var position: [String]
    var number: Int
    var height: Int
    var weight: Int
    var year: String
    var hometown: String
    var highschool: String
    var averages: PlayerAverages
    var games: PlayerData
}

extension Player {
    static let dummyData = [
        0: Player(
            id: 0,
            name: "Evan Williams",
            position: ["Forward"],
            number: 0,
            height: 79,
            weight: 220,
            year: "Senior",
            hometown: "Murphy, Texas",
            highschool: "Plano East Senior HS",
            averages: PlayerAverages.dummyData[0],
            games: PlayerData.dummyData[0]
            
        ),
        1: Player(
            id: 1,
            name: "Nazir Williams",
            position: ["Guard"],
            number: 1,
            height: 75,
            weight: 180,
            year: "Senior",
            hometown: "Nyack, New York",
            highschool: "Blair Academy",
            averages: PlayerAverages.dummyData[0],
            games: PlayerData.dummyData[0]
        ),
        2: Player(
            id: 2,
            name: "Ian Imegwu",
            position: ["Forward"],
            number: 2,
            height: 81,
            weight: 226,
            year: "Freshman",
            hometown: "Short Hills, New Jersey",
            highschool: "Blair Academy",
            averages: PlayerAverages.dummyData[0],
            games: PlayerData.dummyData[0]
        ),
        3: Player(
            id: 3,
            name: "Ryan Kiachian",
            position: ["Forward", "Center"],
            number: 3,
            height: 82,
            weight: 228,
            year: "Junior",
            hometown: "Los Altos Hills, California",
            highschool: "Bellarmine College Preparatory",
            averages: PlayerAverages.dummyData[0],
            games: PlayerData.dummyData[0]
        ),
        5: Player(
            id: 4,
            name: "Jacob Beccles",
            position: ["Guard"],
            number: 5,
            height: 75,
            weight: 178,
            year: "Freshman",
            hometown: "Philadelphia, Pennsylvania",
            highschool: "Constitution HS",
            averages: PlayerAverages.dummyData[0],
            games: PlayerData.dummyData[0]
        ),
        10: Player(
            id: 5,
            name: "Hayden Franson",
            position: ["Forward"],
            number: 10,
            height: 80,
            weight: 218,
            year: "Junior",
            hometown: "American Fork, Utah",
            highschool: "American Fork HS",
            averages: PlayerAverages.dummyData[0],
            games: PlayerData.dummyData[0]
        ),
        11: Player(
            id: 6,
            name: "Adam Tsang Hinton",
            position: ["Guard"],
            number: 11,
            height: 77,
            weight: 213,
            year: "Sophomore",
            hometown: "Studio City, California",
            highschool: "Harvard-Westlake School",
            averages: PlayerAverages.dummyData[0],
            games: PlayerData.dummyData[0]
        ),
        // TODO: Insert the rest of the players from the website linked above
        30: Player(
            id: 7,
            name: "Chris Manon",
            position: ["Guard"],
            number: 30,
            height: 77,
            weight: 209,
            year: "Senior",
            hometown: "New Milford, New Jersey",
            highschool: "Saint Joseph Regional HS",
            averages: PlayerAverages.dummyData[0],
            games: PlayerData.dummyData[0]
        )

    ]
}

// Converts the name to [First Initial. Last Name]
func convertName(_ name: String) -> String {
    let splitName = name.split(separator: " ", maxSplits: 1)
    let firstName = splitName[0]
    let lastName = splitName[1]
    return "\(firstName[firstName.startIndex]). \(lastName)"
}
