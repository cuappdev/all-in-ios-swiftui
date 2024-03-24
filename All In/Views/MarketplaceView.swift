//
//  Marketplace.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

struct MarketplaceView: View {

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {

        // Header
        VStack(spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                Constants.Colors.red
                    .frame(height: 129)
                HStack(alignment: .center) {
                    Text("Marketplace")
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

            // Main frontend
            ScrollView {
                ZStack {
                    Constants.Colors.greybg

                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(Contract.dummyData) { contract in
                            ContractCard(contract: contract)
                        }
                    }.padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                }
            }

            // Tab logic
            TabBar(page: "market")
                .frame(height: 108)
        }
        .ignoresSafeArea(edges: .all)
    }

}

#Preview {
    MarketplaceView()
}
