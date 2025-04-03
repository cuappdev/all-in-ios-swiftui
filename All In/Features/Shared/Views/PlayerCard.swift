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
                Image("Player\(player.number)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.top, 16)

                Text("\(player.firstName.prefix(1)). \(player.lastName)")
                    .font(Constants.Fonts.cardHeader)
                    .foregroundStyle(Constants.Colors.white)

                Text("#\(player.number) | \(player.position[0].prefix(2))")
                    .font(Constants.Fonts.caption)
                    .foregroundStyle(Constants.Colors.white)
                    .padding(.bottom, 16)
            }
            .frame(width: 100, height: 140)
            .background(Constants.Colors.blackBlue)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(LinearGradient(gradient: Constants.Colors.gradient, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
            )
        }
        .sheet(isPresented: $showSheet) {
            PlayerContractSheetView(fromPlayer: player, fromStat: Stat.assists, showSheet: $showSheet)
                .presentationDetents([.fraction(0.6)])
        }
    }
}

#Preview {
    PlayerCard(player: Player.dummyData[0])
        .background(Constants.Colors.background)
}
