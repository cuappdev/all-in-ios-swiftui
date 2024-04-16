//
//  MysteryBox.swift
//  All In
//
//  Created by Peter Bidoshi on 4/15/24.
//

import SwiftUI

struct MysteryBox: View {

    var title: String
    var chestType: String
    var price: Double

    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 26) {
                Spacer()
                VStack {
                    Text(title)
                        .foregroundColor(Constants.Colors.red)
                        .font(
                            Constants.Fonts.subheader
                        )
                }

            }
            .padding()
            .frame(width: 150, height: 155, alignment: .bottom)
            .background(.white)
            .cornerRadius(16)
            .shadow(color: Constants.Colors.grey00, radius: 5, x: 0, y: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                .inset(by: 0.5)
                .stroke(Constants.Colors.grey01, lineWidth: 1)
            )
        }
        .frame(width: 150, height: 195)

    }

}

#Preview {
    MysteryBox(title: "C. Manon", chestType: "Player Chest", price: 1720)
}
