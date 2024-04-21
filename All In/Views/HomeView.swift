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
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
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
                VStack(alignment: .leading, spacing: 0) {
                    Text("Popular Right now")
                        .font(Constants.Fonts.header)
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 0))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(Player.dummyData) { player in
                                ChestView(fromPlayer: player, chestPrice: 1370)
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                    }

                    Spacer()
                }
            }

            TabBar(page: "home")
                .frame(height: 108)
        }
        .ignoresSafeArea(edges: .all)
    }

}

#Preview {
    HomeView()
}
