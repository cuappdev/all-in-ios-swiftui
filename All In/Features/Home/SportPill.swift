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
    let isDisabled: Bool
    let action: () -> Void

    init(sport: Sport, isSelected: Bool, isDisabled: Bool = false, action: @escaping () -> Void) {
        self.sport = sport
        self.isSelected = isSelected
        self.isDisabled = isDisabled
        self.action = action
    }

    var body: some View {
        Button(action: isDisabled ? {} : action) {
            HStack(spacing: 6) {
                // SF Symbol icon
                Image(systemName: sport.icon)
                    .font(.system(size: 14))
                    .foregroundStyle(isDisabled ? Constants.Colors.grey03.opacity(0.6) :
                                        isSelected ? Constants.Colors.white : Constants.Colors.grey03)

                Text(sport.name)
                    .font(Constants.Fonts.pillButtonMain)
                    .foregroundStyle(isDisabled ? Constants.Colors.grey03.opacity(0.6) :
                                        isSelected ? Constants.Colors.white : Constants.Colors.grey03)
                    .strikethrough(isDisabled, color: Constants.Colors.grey03)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(isSelected && !isDisabled ? Constants.Colors.blackBlue : Color.clear)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(isDisabled ? Constants.Colors.grey03.opacity(0.4) :
                                    isSelected ? Constants.Colors.gradientBlue : Constants.Colors.grey03,
                                  lineWidth: 1)
            )
            .opacity(isDisabled ? 0.7 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(isDisabled)
    }
}
