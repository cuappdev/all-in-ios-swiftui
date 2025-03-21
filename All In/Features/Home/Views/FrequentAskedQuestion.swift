//
//  FrequentAskedQuestion.swift
//  All In
//
//  Created by jiwon jeong on 3/16/25.
//

import SwiftUI

struct FrequentAskedQuestion: View {
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
}

// MARK: - Components
extension FrequentAskedQuestion {
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
            ForEach(FAQ.sampleData) { faq in
                questionItem(faq)
            }
        }
    }
}

// MARK: - Functions
extension FrequentAskedQuestion {
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
                .stroke(
                    LinearGradient(
                        gradient: myGradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
        )
    }
}

#Preview {
    FrequentAskedQuestion()
}
