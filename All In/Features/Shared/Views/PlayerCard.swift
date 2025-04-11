//
//  PlayerCard.swift
//  All In
//
//  Created by jiwon jeong on 4/2/25.
//

import SwiftUI

struct PlayerCard: View {

    // MARK: - Properties

    let player: Player
    @State private var showSheet = false

    // MARK: - Body

    var body: some View {
        Button {
            showSheet = true
        } label: {
            VStack(alignment: .center, spacing: 8) {
                AsyncImage(url: URL(string: player.image)) { image in
                    image.resizable()
                } placeholder: {
                    EmptyView()
                }

                Text("\(player.firstName.prefix(1)). \(player.lastName)")
                    .font(Constants.Fonts.cardHeader)
                    .foregroundStyle(Constants.Colors.white)

                Text("#\(player.number) | \(player.positions[0].prefix(2))")
                    .font(Constants.Fonts.caption)
                    .foregroundStyle(Constants.Colors.white)
                    .padding(.bottom, 16)
            }
            .frame(width: 100, height: 140)
            .background(Constants.Colors.blackBlue)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(
                        LinearGradient(
                            gradient: Constants.Colors.gradient,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1
                    )
            )
        }
        .sheet(isPresented: $showSheet) {
            PlayerChestSheetView(fromPlayer: player, showSheet: $showSheet)
                .presentationDetents([.fraction(0.8)])
        }
    }
}

#Preview {
    PlayerCard(player: Player.dummyData[0])
        .background(Constants.Colors.background)
}
