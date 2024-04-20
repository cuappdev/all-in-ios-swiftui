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

    @State var showSheet = false

    init(fromPlayer player: Player, chestPrice: Double) {
        chestImage = Image("PlayerChest")
        chestPlayer = Image(uiImage: UIImage(data: Data(base64Encoded: player.image) ?? Data())!)
        chestType = "Player Chest"
        title = "\(player.firstName[player.firstName.startIndex]). \(player.lastName)"
        price = chestPrice
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
            SheetView(title: "P. Bidoshi", subTitle: "#10 | PG", description: "The best player ever blah hee hee nvm lol ok yes this is a test I love typing a lot of text", buttonText: "Close", showSheet: $showSheet)

                .presentationDetents([.fraction(0.9)])
        }
    }

    func graph(playerData: [PlayerData], metric: Stat) -> some View {
        return (
            Chart {
                ForEach(playerData) { data in
                    BarMark(
                        x: .value("Date", data.gameDate, unit: .weekday),
                        y: .value("Value", data.getNumberFromStat(metric))
                    )
                }
            }
            .aspectRatio(1.0, contentMode: .fit)
        )

    }

}

#Preview {
    ChestView(fromPlayer: Player.dummyData[0], chestPrice: 1720)
}