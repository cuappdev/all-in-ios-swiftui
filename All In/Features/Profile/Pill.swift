//
//  Pill.swift
//  All In
//
//  Created by jiwon jeong on 3/20/25.
//

import SwiftUI

struct Pill: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Constants.Fonts.pillButton)
                .foregroundStyle(Constants.Colors.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .frame(height: 39)
                .background(isSelected ? Constants.Colors.background : Color.clear)
                .cornerRadius(20)
        }
    }
}
