//
//  RarityPackView.swift
//  All In
//
//  Created by jiwon jeong on 4/1/25.
//

import SwiftUI

struct RarityPackView: View {
    var price: Double
    var rarity: Rarity

    @State var showSheet = false

    var body: some View {
        Button {
            showSheet = true
        } label: {
            VStack(alignment: .center, spacing: 8) {
                VStack(alignment: .center) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Constants.Colors.blackBlue, lineWidth: 1)
                            .frame(width: 124, height: 124)
                            .background(Color.clear)

                        // Hexagon image
                        rarity.getPackImage()
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 124, height: 124)
                    .padding(20)
                    .background(Constants.Colors.blackBlue)
                    .cornerRadius(16)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(LinearGradient(gradient: Constants.Colors.gradient, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
                )

                Text(rarity.rawValue.prefix(1).uppercased() + rarity.rawValue.dropFirst().lowercased())
                    .font(Constants.Fonts.mainPack)
                    .foregroundStyle(Constants.Colors.white)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $showSheet) {
            RarityPackSheetView(showSheet: $showSheet, rarity: rarity)
                .presentationDetents([.height(400)])
        }
    }
}

#Preview {
    RarityPackView(price: 1000, rarity: .common)
        .background(Constants.Colors.background)
}
