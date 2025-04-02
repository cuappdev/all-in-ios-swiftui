//
//  SportPill.swift
//  All In
//
//  Created by jiwon jeong on 4/2/25.
//

import SwiftUI

struct SportPill: View {
    let sport: Sport
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                // SF Symbol icon
                Image(systemName: sport.icon)
                    .font(.system(size: 14))
                    .foregroundStyle(isSelected ? Constants.Colors.white : Constants.Colors.grey03)

                Text(sport.name)
                    .font(Constants.Fonts.pillButtonMain)
                    .foregroundStyle(isSelected ? Constants.Colors.white : Constants.Colors.grey03)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(isSelected ? Constants.Colors.blackBlue : Color.clear)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Constants.Colors.gradientBlue : Constants.Colors.grey03, lineWidth: 1)
            )
            .padding(.horizontal, 0.5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
