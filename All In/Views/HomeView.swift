//
//  HomeView.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/3/24.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                Constants.Colors.white
                    .frame(height: 129)
                HStack(alignment: .bottom) {
                    Text("All In")
                        .font(Constants.Fonts.title)
                        .foregroundStyle(Constants.Colors.black)
                    Spacer()
                    HStack {
                        Image("Money")
                            .renderingMode(.template)
                            .foregroundStyle(Constants.Colors.red)
                        Text("1,000")
                            .font(Constants.Fonts.subheader)
                            .foregroundStyle(Constants.Colors.black)
                    }
                }
                .padding()
            }
            Divider()

            ZStack {

                Constants.Colors.greybg
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Player Chests")
                            .font(Constants.Fonts.header)
                            .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 0))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(Player.dummyData) { player in
                                    PlayerChestView(fromPlayer: player, chestPrice: 1370)
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        }

                        Text("Rarity Chests")
                            .font(Constants.Fonts.header)
                            .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 0))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                RarityChestView(price: 1200, rarity: .Common)
                                RarityChestView(price: 1500, rarity: .Rare)
                                RarityChestView(price: 2100, rarity: .Epic)
                                RarityChestView(price: 2500, rarity: .Legendary)
                            }
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        }

                        Text("Marketplace Glimpse")
                            .font(Constants.Fonts.header)
                            .padding(EdgeInsets(top: 16, leading: 16, bottom: 8, trailing: 0))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(Contract.dummyData[0..<5]) { contract in
                                    ContractCard(contract: contract)
                                        .cornerRadius(16)
                                }
                                moreMarketplaceContracts()
                            }
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        }
                    }
                    Spacer()
                }
            }

            TabBar(page: "home")
                .frame(height: 108)
        }
        .ignoresSafeArea(edges: .all)
    }

    func moreMarketplaceContracts() -> some View {
        return (
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .inset(by: 0.5)
                    .stroke(Constants.Colors.grey02, lineWidth: 1)
                    .frame(width: 181, height: 222)
                    .background(.white)
                    .cornerRadius(16)
                    .shadow(color: Constants.Colors.grey00, radius: 5, x: 0, y: 4)
                VStack {
                    Text("View More")
                        .foregroundStyle(Constants.Colors.grey03)
                    Image(systemName: "arrowshape.forward.circle.fill")
                        .resizable()
                        .foregroundStyle(Constants.Colors.grey03)
                        .frame(width: 42, height: 42)
                }
            }
                .font(Constants.Fonts.subheader)
                .frame(width: 181, height: 222)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Constants.Colors.white)
                }
        )
    }

}

#Preview {
    HomeView()
}
