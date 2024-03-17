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
                Constants.Colors.red
                    .frame(height: 129)
                HStack(alignment: .center) {
                    Text("Packs")
                        .font(.system(size: 34, weight: .heavy))
                        .foregroundStyle(.white)
                    Spacer()
                    HStack {
                        Image("Money")
                        Text("1000")
                            .font(.system(size: 18, weight: .heavy))
                            .foregroundStyle(.white)
                    }
                }
                .padding()
            }

            ZStack {
                Constants.Colors.greybg
                Text("HELlo WORLD").foregroundStyle(.white)
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
