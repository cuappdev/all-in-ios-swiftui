//
//  FrequentAskedQuestion.swift
//  All In
//
//  Created by jiwon jeong on 3/16/25.
//

import SwiftUI

struct FAQ: Identifiable {
    let id = UUID()
    let question: String
    let answer: String
}

struct FrequentAskedQuestion: View {

    private let faqData = [
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

    @State private var expandedQuestionIds = Set<UUID>()

    var myGradient = Gradient(
        colors: [
          Constants.Colors.gradientBlue,
          Constants.Colors.gradientLightBlue,
          Constants.Colors.gradientPurple,
          Constants.Colors.gradientLavender
        ]
    )

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    header
                    
                    questionsList
                    
                    Spacer(minLength: 20)
                }
                .padding(.horizontal)
                .padding(.top, 40)
                .frame(maxWidth: .infinity)
            }
            .background(Constants.Colors.background)
            .scrollIndicators(.hidden)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("How can we help?")
                .font(Constants.Fonts.faq)
                .foregroundStyle(Constants.Colors.white)

            Text("Frequently Asked Questions")
                .font(Constants.Fonts.faq2)
                .foregroundStyle(Constants.Colors.white)
                .padding(.bottom, 24)
        }
    }

    private var questionsList: some View {
        VStack(spacing: 16) {
            ForEach(faqData) { faq in
                questionItem(faq)
            }
        }
    }

    private func questionItem(_ faq: FAQ) -> some View {
        let isExpanded = expandedQuestionIds.contains(faq.id)

        return VStack(alignment: .leading, spacing: 0) {
            // Question button
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    if isExpanded {
                        expandedQuestionIds.remove(faq.id)
                    } else {
                        expandedQuestionIds.insert(faq.id)
                    }
                }
            }) {
                HStack {
                    Circle()
                        .fill(isExpanded ? Constants.Colors.lightBlue : Constants.Colors.blue)
                        .frame(width: 24, height: 24)

                    Text(faq.question)
                        .font(Constants.Fonts.body)
                        .foregroundStyle(Constants.Colors.white)

                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            // Answer section (only visible when expanded)
            if isExpanded {
                Text(faq.answer)
                    .font(Constants.Fonts.body)
                    .foregroundStyle(Constants.Colors.white.opacity(0.8))
                    .padding([.horizontal, .bottom])
                    .padding(.top, 4)
                    .transition(.opacity)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .background(Constants.Colors.blackBlue)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(LinearGradient(gradient: myGradient, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
        )
    }
}

#Preview {
    FrequentAskedQuestion()
}
