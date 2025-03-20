//
//  FrequentAskedQuestion.swift
//  All In
//
//  Created by jiwon jeong on 3/16/25.
//

import SwiftUI

struct FrequentAskedQuestion: View {
    // Questions data
    private let questions = [
        "What is sports betting?",
        "How do we place a bet?",
        "Do you keep your profit?",
        "What happens if a game is canceled?",
        "How do I report issues?"
    ]

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
            VStack(alignment: .leading, spacing: 20) {
                header
                questionsList
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 40)
            .frame(maxWidth: .infinity)
            .background(Constants.Colors.black)
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
                .italic()
                .padding(.bottom, 24)
        }
    }

    private var questionsList: some View {
        VStack(spacing: 16) {
            ForEach(questions, id: \.self) { question in
                questionButton(question)
            }
        }
    }

    private func questionButton(_ question: String) -> some View {
        HStack {
            Circle()
                .fill(Constants.Colors.blue)
                .frame(width: 24, height: 24)

            Text(question)
                .font(Constants.Fonts.body)
                .foregroundStyle(Constants.Colors.white)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 28/255, green: 28/255, blue: 48/255))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(LinearGradient(gradient: myGradient, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
        )
    }
}

#Preview {
    FrequentAskedQuestion()
}
