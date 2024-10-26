//
//  RarityChestView.swift
//  All In
//
//  Created by Peter Bidoshi on 4/22/24.
//

import SwiftUI

struct RarityChestView: View {

    var price: Double
    var rarity: Rarity

    @State var showSheet = false

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
                        rarity.getChestImage()
                            .resizable()
                            .frame(width: 112, height: 96)

                        Text("\(rarity.string)")
                            .foregroundStyle(rarity.getColor())
                            .font(Constants.Fonts.subheader)

                        Text("Rarity Chest")
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
            RarityChestSheetView(rarity: rarity, showSheet: $showSheet)
                .presentationDetents([.fraction(0.4)])
        }
    }

}

#Preview {
    RarityChestView(price: 1000, rarity: .legendary)
}
