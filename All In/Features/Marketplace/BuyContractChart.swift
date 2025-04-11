//
//  BuyContractChart.swift
//  All In
//
//  Created by Angelina Chen on 4/11/25.
//

import SwiftUI

struct StatLine: Identifiable {
    let id = UUID()
    let label: String
    let games: Int
    let pts: Double
    let trb: Double
    let ast: Double
}

struct BuyContractChart: View {
    let stats: [StatLine]

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 20) {
                Text("  ").frame(width: 63)
                Text("G").frame(maxWidth: .infinity)
                Text("PTS").frame(maxWidth: .infinity)
                Text("TRB").frame(maxWidth: .infinity)
                Text("AST").frame(maxWidth: .infinity)
            }
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .padding()
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Constants.Colors.gradientBlue,
                        Constants.Colors.gradientLightBlue,
                        Constants.Colors.gradientLavender,
                        Constants.Colors.gradientLavender,
                        Constants.Colors.gradientPurple
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(
                .rect(
                        topLeadingRadius: 20,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 20
                    )
            )

            VStack(spacing: 0) {
                ForEach(stats) { stat in
                    HStack {
                        Text(stat.label)
                            .frame(width: 60, alignment: .leading)
                            .padding(.leading, 20)
                        Text("\(stat.games)").frame(maxWidth: .infinity)
                        Text(String(format: "%.1f", stat.pts)).frame(maxWidth: .infinity)
                        Text(String(format: "%.1f", stat.trb)).frame(maxWidth: .infinity)
                        Text(String(format: "%.1f", stat.ast)).frame(maxWidth: .infinity)
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 12)

                    if stat.id != stats.last?.id {
                        Divider()
                            .background(Color.white.opacity(0.3))
                            .padding(.horizontal, 10)
                    }
                }
            }
        }
        .background(Constants.Colors.blackBlue)
        .clipShape(
            .rect(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 20,
                    bottomTrailingRadius: 20,
                    topTrailingRadius: 0
                )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    LinearGradient(
                        gradient: Constants.Colors.gradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 2
                )
        )
    }
}

#Preview {
    BuyContractChart(stats: [
        StatLine(label: "24–25", games: 33, pts: 6.6, trb: 3.7, ast: 1.3),
        StatLine(label: "Career", games: 116, pts: 9.9, trb: 3.8, ast: 2.1)
    ])
}
