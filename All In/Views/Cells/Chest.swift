//
//  Chest.swift
//  All In
//
//  Created by Peter Bidoshi on 4/15/24.
//

import SwiftUI

struct ChestView: View {

    var chestImage: Image
    var chestPlayer: Image?
    var chestType: String
    var title: String
    var price: Double

    @State var showSheet = false

    var body: some View {
        Button {
            showSheet = true
        } label: {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 16)
                    .inset(by: 0.5)
                    .stroke(Constants.Colors.grey02, lineWidth: 1)
                    .frame(width: 150, height: 155)
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
                            .foregroundStyle(Constants.Colors.grey01)
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
            VStack() {
                HStack {
                    Text(title)
                    Text("#14 | PG")
                        .foregroundStyle(Constants.Colors.grey02)
                    Spacer()
                    Button {
                        showSheet = false
                    } label: {
                        Circle()
                            .foregroundStyle(Constants.Colors.grey01)
                            .frame(width: 40, height: 40)
                            .overlay {
                                Image("X")
                            }
                    }
                }
                .font(Constants.Fonts.header)

                Spacer()
            }
            .padding(24)
            .presentationDetents([.fraction(0.9)])
            .presentationDragIndicator(.visible)
            .presentationCornerRadius(16)
        }
    }

}

#Preview {
    ChestView(chestImage: Image("PlayerChest"), chestType: "Player Chest", title: "C. Manon", price: 1720, showSheet: true)
}
