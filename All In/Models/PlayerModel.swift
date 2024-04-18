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
    var firstName: String
    var lastName: String
    var position: String
    var number: Int
    var height: Int
    var weight: Int
    var year: Int
    var hometown: String
    var highSchool: String;
    var image: String;
    var bio: String;

}

extension Player {

    static let dummyData: [Player] = [
        Player(
            id: 0,
            firstName: "Evan",
            lastName: "Williams",
            position: "Forward",
            number: 0,
            height: 79,
            weight: 220,
            year: 2024,
            hometown: "Murphy, Texas",
            highSchool: "Plano East Senior HS",
            image: "",
            bio: ""
        ),
        Player(
            id: 1,
            firstName: "Nazir",
            lastName: "Williams",
            position: "Guard",
            number: 1,
            height: 75,
            weight: 180,
            year: 2024,
            hometown: "Nyack, New York",
            highSchool: "Blair Academy",
            image: "",
            bio: ""
        ),
        Player(
            id: 2,
            firstName: "Ian",
            lastName: "Imegwu",
            position: "Forward",
            number: 2,
            height: 81,
            weight: 226,
            year: 2027,
            hometown: "Short Hills, New Jersey",
            highSchool: "Blair Academy",
            image: "",
            bio: ""
        ),
        Player(
            id: 3,
            firstName: "Ryan",
            lastName: "Kiachian",
            position: "Forward, Center",
            number: 3,
            height: 82,
            weight: 228,
            year: 2024,
            hometown: "Los Altos Hills, California",
            highSchool: "Bellarmine College Preparatory",
            image: "",
            bio: ""
        ),
        Player(
            id: 4,
            firstName: "Dylan",
            lastName: "Wang",
            position: "Guard",
            number: 4,
            height: 72,
            weight: 170,
            year: 2024,
            hometown: "Los Altos Hills, California",
            highSchool: "Bellarmine College Preparatory",
            image: "",
            bio: ""
        ),
        Player(
            id: 5,
            firstName: "Dylan",
            lastName: "Wang",
            position: "Guard",
            number: 5,
            height: 72,
            weight: 170,
            year: 2024,
            hometown: "Los Altos Hills, California",
            highSchool: "Bellarmine College Preparatory",
            image: "",
            bio: ""
        ),
        Player(
            id: 6,
            firstName: "Dylan",
            lastName: "Wang",
            position: "Guard",
            number: 6,
            height: 72,
            weight: 170,
            year: 2024,
            hometown: "Los Altos Hills, California",
            highSchool: "Bellarmine College Preparatory",
            image: "",
            bio: ""
        ),
        Player(
            id: 7,
            firstName: "Dylan",
            lastName: "Wang",
            position: "Guard",
            number: 7,
            height: 72,
            weight: 170,
            year: 2024,
            hometown: "Los Altos Hills, California",
            highSchool: "Bellarmine College Preparatory",
            image: "",
            bio: ""
        ),
        Player(
            id: 8,
            firstName: "Dylan",
            lastName: "Wang",
            position: "Guard",
            number: 8,
            height: 72,
            weight: 170,
            year: 2024,
            hometown: "Los Altos Hills, California",
            highSchool: "Bellarmine College Preparatory",
            image: "",
            bio: ""
        ),
        Player(
            id: 9,
            firstName: "Dylan",
            lastName: "Wang",
            position: "Guard",
            number: 9,
            height: 72,
            weight: 170,
            year: 2024,
            hometown: "Los Altos Hills, California",
            highSchool: "Bellarmine College Preparatory",
            image: "",
            bio: ""
        ),
        Player(
            id: 10,
            firstName: "Dylan",
            lastName: "Wang",
            position: "Guard",
            number: 10,
            height: 72,
            weight: 170,
            year: 2024,
            hometown: "Los Altos Hills, California",
            highSchool: "Bellarmine College Preparatory",
            image: "",
            bio: ""
        ),
        Player(
            id: 11,
            firstName: "Dylan",
            lastName: "Wang",
            position: "Guard",
            number: 11,
            height: 72,
            weight: 170,
            year: 2024,
            hometown: "Los Altos Hills, California",
            highSchool: "Bellarmine College Preparatory",
            image: "",
            bio: ""
        ),
        Player(
            id: 12,
            firstName: "Dylan",
            lastName: "Wang",
            position: "Guard",
            number: 12,
            height: 72,
            weight: 170,
            year: 2024,
            hometown: "Los Altos Hills, California",
            highSchool: "Bellarmine College Preparatory",
            image: "",
            bio: ""
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
