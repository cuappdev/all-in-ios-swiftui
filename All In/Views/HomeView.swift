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
                HStack(alignment: .center) {
                    Text("All In")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundStyle(.black)
                    Spacer()
                    HStack {
                        Image("Money")
                        Text("1000")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.black)
                    }
                }
                .padding()
            }
            Divider()

            ZStack {
                Constants.Colors.greybg
                Text("HELlo WORLD").foregroundStyle(.black)
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
