//
//  FAQ.swift
//  All In
//
//  Created by jiwon jeong on 3/21/25.
//

import Foundation

struct FAQ: Identifiable {
    let id = UUID()
    let question: String
    let answer: String

    static let sampleData: [FAQ] = [
        FAQ(
            question: "What is sports betting?",
            answer: """
            Sports betting is the act of placing a wager on the outcome of a sporting event. \
            It allows individuals to bet on various aspects of a game, such as which team \
            will win, the final score, or specific player performances.
            """
        ),
        FAQ(
            question: "How do we place a bet?",
            answer: """
            Bets are placed in Home or Marketplace. In Home, you have the ability to buy \
            "packs" by rarity type or player. There are four different levels of rarity \
            which are common, rare, epic, and legendary. You can choose to buy a pack \
            under a specific player of your choosing.

            In marketplace, you can buy an event that is being sold secondhand from another \
            user who opened up a rarity or player pack that you want to pursue.

            When you choose a pack in Home or a contract in Marketplace, you will see they \
            in your cart organized by the screen you bought them from. Once you place your \
            bet, you will see all of your bets that are pending on the results in your Bet \
            Tracker under Active Bets.
            """
        ),
        FAQ(
            question: "Do you keep your profit?",
            answer: """
            All costs and gains you make are fictional and do not correlate with \
            non-fictional currency.
            """
        ),
        FAQ(
            question: "What happens if a game is canceled?",
            answer: """
            All games that are postponed or canceled will result in a refund in the \
            original amount you spent to obtain that pack or contract.
            """
        ),
        FAQ(
            question: "How do I report issues?",
            answer: """
            Please email us at cornellappdev@gmail.com if you are experiencing any \
            issues or bugs.
            """
        )
    ]
}
