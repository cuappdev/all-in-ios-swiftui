//
//  PlayerModel.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

// https://cornellbigred.com/sports/mens-basketball/roster
// TODO: Add the rest of the data

struct Player {
    var name : String
    var position : [String]
    var number: Int
    var height: Int
    var weight: Int
    var year: String
    var hometown: String
    var highschool: String
}

extension Player {
    static let dummyData = [
        0: Player(
            name: "Evan Williams",
            position: ["Forward"],
            number: 0,
            height: 79,
            weight: 220,
            year: "Senior",
            hometown: "Murphy, Texas",
            highschool: "Plano East Senior HS"
        ),
        1: Player(
            name: "Nazir Williams",
            position: ["Guard"],
            number: 1,
            height: 75,
            weight: 180,
            year: "Senior",
            hometown: "Nyack, New York",
            highschool: "Blair Academy"
        ),
        2: Player(
            name: "Ian Imegwu",
            position: ["Forward"],
            number: 2,
            height: 81,
            weight: 226,
            year: "Freshman",
            hometown: "Short Hills, New Jersey",
            highschool: "Blair Academy"
        ),
        3: Player(
            name: "Ryan Kiachian",
            position: ["Forward", "Center"],
            number: 3,
            height: 82,
            weight: 228,
            year: "Junior",
            hometown: "Los Altos Hills, California",
            highschool: "Bellarmine College Preparatory"
        ),
        5: Player(
            name: "Jacob Beccles",
            position: ["Guard"],
            number: 5,
            height: 75,
            weight: 178,
            year: "Freshman",
            hometown: "Philadelphia, Pennsylvania",
            highschool: "Constitution HS"
        ),
        10: Player(
            name: "Hayden Franson",
            position: ["Forward"],
            number: 10,
            height: 80,
            weight: 218,
            year: "Junior",
            hometown: "American Fork, Utah",
            highschool: "American Fork HS"
        ),
        11: Player(
            name: "Adam Tsang Hinton",
            position: ["Guard"],
            number: 11,
            height: 77,
            weight: 213,
            year: "Sophomore",
            hometown: "Studio City, California",
            highschool: "Harvard-Westlake School"
        ),
        // TODO: Insert the rest of the players from the website linked above
        30: Player(
            name: "Chris Manon",
            position: ["Guard"],
            number: 30,
            height: 77,
            weight: 209,
            year: "Senior",
            hometown: "New Milford, New Jersey",
            highschool: "Saint Joseph Regional HS"
        )

    ]
}

// Converts the name to [First Initial. Last Name]
func convertName(_ name: String) -> String {
    let split_name = name.split(separator: " ", maxSplits: 1)
    let first_name = split_name[0]
    let last_name = split_name[1]
    return "\(first_name[first_name.startIndex]). \(last_name)"
}
