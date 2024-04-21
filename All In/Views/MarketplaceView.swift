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
                Constants.Colors.white
                    .frame(height: 129)
                HStack(alignment: .center) {
                    Text("Marketplace")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundStyle(.black)
                    Spacer()
                    HStack {
                        Image("RedMoney")
                        Text("1,000")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.black)
                    }
                }
                .padding()
            }
            Divider()

            // Main frontend
            ScrollView {
                ZStack {
                    Constants.Colors.grey00

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
