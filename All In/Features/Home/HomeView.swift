//
//  HomeView.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/3/24.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var viewModel: ProfileViewViewModel
    @EnvironmentObject var tabNavigationManager: TabNavigationManager

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                Constants.Colors.white
                    .frame(height: 129)
                HStack {
                    Text("All In")
                        .font(Constants.Fonts.title)
                        .foregroundStyle(Constants.Colors.black)
                    Spacer()
                    HStack {
                        Image("RedMoney")
                        Text(viewModel.user.balance.withCommas())
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.black)
                    }
                }
                .padding()
            }
            Divider()

            ZStack {
                Constants.Colors.background
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
                                RarityChestView(price: 1200, rarity: .common)
                                RarityChestView(price: 1500, rarity: .rare)
                                RarityChestView(price: 2100, rarity: .epic)
                                RarityChestView(price: 2500, rarity: .legendary)
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

                                moreMarketplaceContracts
                            }
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        }
                    }
                    Spacer()
                }
            }
        }
        .ignoresSafeArea(edges: .top)

    }

    private var moreMarketplaceContracts: some View {
            Button {
                tabNavigationManager.selectedTab = .market
            } label: {
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
            }
    }
}

#Preview {
    HomeView()
        .environmentObject(ProfileViewViewModel())
        .environmentObject(TabNavigationManager())
}
