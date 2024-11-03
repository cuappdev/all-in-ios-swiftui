//
//  Marketplace.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

struct MarketplaceView: View {

    @StateObject var viewModel = ViewModel()
    @State var selectedStat: Stat = .points

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {

        VStack(spacing: 0) {
            header

            Divider()

            content
        }
        .ignoresSafeArea(edges: .top)
        .background(Constants.Colors.grey00)
    }

    private var header: some View {
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
                    Text(1000.withCommas())
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.black)
                }
            }
            .padding()
        }
    }

    private var content: some View {
        ScrollView {
            ZStack {
                Constants.Colors.grey00

                VStack {
                    // Search bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(
                                viewModel.searchText.isEmpty ? Constants.Colors.grey03 : Constants.Colors.red
                            )
                        TextField("Search", text: $viewModel.searchText)
                            .foregroundColor(Constants.Colors.grey03)
                            .overlay(
                                Image(
                                    systemName: "x.circle.fill"
                                )
                                .offset(x: 8)
                                .opacity(viewModel.searchText.isEmpty ? 0.0 : 1.0)
                                .onTapGesture {
                                    viewModel.searchText = ""
                                },
                                alignment: .trailing
                            )
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Constants.Colors.grey02, lineWidth: 1)
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Constants.Colors.white)
                    )
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                    PillSelectView(Stat.getAll()) { newStat in
                        selectedStat = newStat
                    }
                    .padding(EdgeInsets(top: -8, leading: -8, bottom: -8, trailing: -8))
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.filteredContracts, id: \.id) { contract in ContractCard(contract: contract)
                        }
                        .cornerRadius(16)
                    }
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                }
            }
        }
    }

}

#Preview {
    MarketplaceView()
}
