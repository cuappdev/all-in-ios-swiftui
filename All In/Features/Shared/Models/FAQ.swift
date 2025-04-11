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

    static let homeFAQs: [FAQ] = [
        FAQ(
            question: "What does Home include?",
            answer: """
            In Home, you have access to rarity packs and player packs. \
            Each type of pack allows for you to get a contract under each type of pack. \
            If you choose to buy a legendary pack, you will get an event in the legendary category. \
            If you decide to buy a player pack under a player named “John Doe”,  \
            you will get an event correlated with “John Doe”.
            """
        ),
        FAQ(
            question: "What can I buy in Home?",
            answer: """
            In Home, you have access to rarity packs and player packs. \
            Each type of pack allows for you to get a contract under each type of pack. \
            Rarity packs are associated with the probability of each contract happening. \
            A common pack means a common  \
            event will be behind that pack. Because the event is more common, the payout will be lower.  \
            Player packs are associated with the player, and you will be able to buy a  \
            player pack for any of the players in the Cornell team under that sport.
            If you choose to buy a legendary pack, you will get \
            an event in the legendary category. \
            If you decide to buy a player pack under a player named “John Doe”, \
            you will get an event correlated with “John Doe”.
            """
        ),
        FAQ(
            question: "What is the ranking based on?",
            answer: """
            The rankings are all based on the \
            total profit the user currently has.
            """
        )
    ]

    static let marketplaceFAQs: [FAQ] = [
        FAQ(
            question: "What does Marketplace include?",
            answer: """
            The marketplace is includes all of your recommended contracts, the contracts ending today, \
            and all of the contracts that have been posted by users..
            """
        ),
        FAQ(
            question: "What can I buy in Marketplace?",
            answer: """
            The marketplace serves as a second economy from what the Home screen offers, \
            which are rarity and player packs. \
            The key difference is that while you get a randomized contract based on the \
            condition you buy it under in Home, \
            in Marketplace, you are able to see the full information of the contract. \
            However, the contract has been placed \
            onto the marketplace by a user, set at a price by the user.
            """
        ),
        FAQ(
            question: "How do you buy or sell?",
            answer: """
            At the bottom of the screen, you will see a floating button with the icon of a cart. \
            Click onto the
            """
        )
    ]
}
