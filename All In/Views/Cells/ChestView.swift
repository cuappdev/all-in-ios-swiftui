//
//  ChestView.swift
//  All In
//
//  Created by Peter Bidoshi on 4/15/24.
//

import Charts
import SwiftUI

struct ChestView: View {

    var chestImage: Image
    var chestPlayer: Image?
    var chestType: String
    var title: String
    var price: Double
    var player: Player

    @State var showSheet = false

    init(fromPlayer player: Player, chestPrice: Double) {
        chestImage = Image("PlayerChest")
        chestPlayer = Image("")
        NetworkManager.shared.getUserImage(completion: { image in
            chestPlayer = Image(
        }))
        chestPlayer = Image()
        chestType = "Player Chest"
        title = "\(player.firstName[player.firstName.startIndex]). \(player.lastName)"
        price = chestPrice
        self.player = player
    }

    var body: some View {
        Button {
            showSheet = true
        } label: {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 16)
                    .inset(by: 0.5)
                    .stroke(Constants.Colors.grey02, lineWidth: 1)
                    .frame(width: 150, height: 150)
                    .background(.white)
                    .cornerRadius(16)
                    .shadow(color: Constants.Colors.grey00, radius: 5, x: 0, y: 4)

                VStack(alignment: .center, spacing: 26) {

                    VStack {
                        ZStack(alignment: .topTrailing) {
                            chestImage
                                .resizable()

                            chestPlayer?
                                .resizable()
                                .frame(width: 48, height: 64)
                                .background()
                                .clipShape(Circle())
                                .overlay(
                                    RoundedRectangle(cornerRadius: 100)
                                        .inset(by: 0.5)
                                        .stroke(Constants.Colors.grey02)
                                        .frame(width: 48, height: 48)
                                )
                        }
                        .frame(width: 112, height: 96)


                        Text(title)
                            .foregroundStyle(Constants.Colors.red)
                            .font(Constants.Fonts.subheader)

                        Text(chestType)
                            .foregroundStyle(Constants.Colors.grey03)
                            .font(Constants.Fonts.bodyBold)

                        HStack {
                            Image("Money")
                            Text("\(Int(price))")
                                .foregroundStyle(Constants.Colors.black)
                                .font(Constants.Fonts.bodyBold)
                        }
                    }
                }
                .padding()
                .frame(width: 150, height: 195)
            }
            .frame(width: 150, height: 195)
        }
        .sheet(isPresented: $showSheet) {
            PlayerChestSheetView(fromPlayer: player, showSheet: $showSheet)
                .presentationDetents([.fraction(0.9)])
        }

    }
}


#Preview {
    ChestView(fromPlayer: Player.dummyData[0], chestPrice: 1720)
}
